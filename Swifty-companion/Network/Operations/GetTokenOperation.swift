//
//  GetTokenOperation.swift
//  Swifty-companion
//
//  Created by VKoshelev@detmir.ru on 18.09.2021.
//

import Foundation

final class GetTokenOperation: Operation {

    override func main() {
        guard let url = NetworkConstants.getAccessTokenUrl else { return }
        let body = AppParametrs()
        
        var request = URLRequest(url: url)
        request.httpMethod = NetworkConstants.HttpMethods.post
        request.httpBody = try? JSONEncoder().encode(body)
        request.allHTTPHeaderFields = [
            NetworkConstants.HttpHeader.contentType: NetworkConstants.HttpHeader.json
        ]
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let data = data {
                let cred = try? JSONDecoder().decode(UserCredential.self, from: data)
            }
        }.resume()
    }
}
