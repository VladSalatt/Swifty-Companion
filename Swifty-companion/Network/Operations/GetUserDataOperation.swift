//
//  GetUserData.swift
//  Swifty-companion
//
//  Created by VKoshelev@detmir.ru on 18.09.2021.
//

import Foundation

final class GetUserDataOperation: Operation {
    
    private let login: String
    private let userCredential: UserCredential?
    
    var success: ((UserData) -> Void)?
    var failure: ((Error?) -> Void)?
    
    init(_ login: String,_ userCredential: UserCredential?) {
        self.userCredential = userCredential
        self.login = login
        super.init()
    }
    
    override func main() {
        guard let url = URL(string: login, relativeTo: NetworkConstants.getUserDataUrl),
              let userCredential = userCredential else {
            return
        }
        
        var request = URLRequest(url: url)
        let bearerToken = "\(NetworkConstants.HttpHeader.bearer) \(userCredential.accessToken)"
        request.allHTTPHeaderFields = [
            NetworkConstants.HttpHeader.authorization: bearerToken
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
                      let userData = try? JSONDecoder().decode(UserData.self, from: data) else {
                    self.failure?(NetworkErrors.invalidData)
                    return
                }
                self.success?(userData)
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
