//
//  GetUserData.swift
//  Swifty-companion
//
//  Created by VKoshelev@detmir.ru on 18.09.2021.
//

import Foundation

final class GetUserDataOperation: Operation {
    
    let login: String
    
    init(_ login: String) {
        self.login = login
        super.init()
    }
    
    override func main() {
        guard let url = URL(string: login, relativeTo: NetworkConstants.getUserDataUrl) else { return }
        
        var request = URLRequest(url: url)
        
        // HardCode
        request.allHTTPHeaderFields = [
            NetworkConstants.HttpHeader.authorization: "\(NetworkConstants.HttpHeader.bearer)6b4a9027ff1b9c6b880a66f631c02a4f0671d3f04b83b515f6bada83eb39a985"
        ]
    
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            if let data = data {
                let userData = try? JSONDecoder().decode(UserData.self, from: data)
            }
        }.resume()
    }
}
