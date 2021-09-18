//
//  NetworkService.swift
//  Swifty-companion
//
//  Created by VKoshelev@detmir.ru on 10.09.2021.
//

import Foundation

protocol NetworkServiceProtocol {
//    func getProfile()
}

final class NetworkService: NetworkServiceProtocol {

    private var operationQueue = OperationQueue()
        
    func getProfileWith(_ login: String) {
        let getTokenOperation = GetTokenOperation()
        
        operationQueue.addOperation(getTokenOperation)
        getUserDataWith(login)
    }

    private func getUserDataWith(_ login: String) {
        let getUserDataOperation = GetUserDataOperation(login)
        
        operationQueue.addOperation(getUserDataOperation)
    }

    private func getImageData() {
        
    }
}
