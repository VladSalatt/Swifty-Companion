//
//  GetTokenOperation.swift
//  Swifty-companion
//
//  Created by VKoshelev@detmir.ru on 18.09.2021.
//

import Foundation

final class GetTokenOperation: Operation {
    
    private var userCredential: UserCredential?
    
    var success: ((UserCredential?) -> Void)?
    var failure: ((Error?) -> Void)?
    
    init(userCredential: UserCredential?) {
        self.userCredential = userCredential
        super.init()
    }

    override func main() {
        if userCredential != nil, userCredential?.isExpired() == false {
            self.success?(nil)
            return
        }
        
        guard let url = NetworkConstants.getAccessTokenUrl else {
            self.failure?(NetworkErrors.invalidUrl)
            return
        }

        let body = AppParametrs()
        
        var request = URLRequest(url: url)
        request.httpMethod = NetworkConstants.HttpMethods.post
        request.httpBody = try? JSONEncoder().encode(body)
        request.allHTTPHeaderFields = [
            NetworkConstants.HttpHeader.contentType: NetworkConstants.HttpHeader.json
        ]

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                self.failure?(NetworkErrors.invalidSession)
                return
            }
            guard let response = response as? HTTPURLResponse else {
                self.failure?(NetworkErrors.invalidResponse)
                return
            }
            
            switch response.statusCode {
            case 200:
                guard let data = data,
                      let userCredential = try? JSONDecoder().decode(UserCredential.self, from: data) else {
                    self.failure?(NetworkErrors.invalidData)
                    return
                }
                
                
                self.success?(userCredential)
            case 400:
                self.failure?(NetworkErrors.invalidRequest)
            case 401:
                self.failure?(NetworkErrors.unauthorized)
            case 403:
                self.failure?(NetworkErrors.forbidden)
            case 404:
                self.failure?(NetworkErrors.notFound)
            case 422:
                self.failure?(NetworkErrors.invalidEntity)
            case 500:
                self.failure?(NetworkErrors.invalidServer)
            default:
                self.failure?(NetworkErrors.unknown)
            }
        }.resume()
    }
}
