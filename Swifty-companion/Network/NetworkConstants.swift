//
//  File.swift
//  Swifty-companion
//
//  Created by VKoshelev@detmir.ru on 18.09.2021.
//

import Foundation

struct NetworkConstants {
    static let baseUrl = URL(string: "https://api.intra.42.fr")
    static let getAccessTokenUrl = URL(string: "/v2/oauth/token/", relativeTo: baseUrl)
    static let getUserDataUrl = URL(string: "/v2/users/", relativeTo: baseUrl)
    
    enum HttpMethods {
        static let get = "GET"
        static let post = "POST"
    }
    
    enum HttpHeader {
        static let contentType = "Content-Type"
        static let json = "application/json; charset=utf-8"
        
        static let authorization = "Authorization"
        static let bearer = "Bearer "
    }
    
}

struct AppParametrs: Codable {
    var grant_type = "client_credentials"
    var client_id = "13d42cf10edb8d934c364005b84419bb66fbcff2fb6212498aa5a885704b35d8"
    var client_secret = "ca3f589627e7c548a2dc177743258cfbcda947de0e357e0643537aa9a2a9731e"
}
