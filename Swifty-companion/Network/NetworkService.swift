//
//  NetworkService.swift
//  Swifty-companion
//
//  Created by VKoshelev@detmir.ru on 10.09.2021.
//

import Foundation

protocol NetworkServiceProtocol {
    func getProfile()
}

final class NetworkService: NetworkServiceProtocol {
    func getProfile(completion: @escaping () -> Void) {
        
    }
    
    
}
