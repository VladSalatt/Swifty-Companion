//
//  NetworkService.swift
//  Swifty-companion
//
//  Created by VKoshelev@detmir.ru on 10.09.2021.
//

import Foundation

protocol UserCredentialStorage {
    var userCredential: UserCredential? { get }
}

protocol NetworkServiceProtocol {
    func getProfileWith(_ login: String, success: ((UserData) -> Void)?, failure: ((Error?) -> Void)?)
}

final class NetworkService: NetworkServiceProtocol {

    private var operationQueue = OperationQueue()
    
    var userCredential: UserCredential? {
        didSet {
            if let userCredential = userCredential {
                let data = try? JSONEncoder().encode(userCredential)
                UserDefaults.standard.set(data, forKey: NetworkConstants.UserCredential.userCredential)
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: NetworkConstants.UserCredential.userCredential),
           let userCredential = try? JSONDecoder().decode(UserCredential.self, from: data) {
            self.userCredential = userCredential
        }
    }
        
    func getProfileWith(_ login: String,
                        success: ((UserData) -> Void)?,
                        failure: ((Error?) -> Void)?
    ) {
        let getTokenOperation = GetTokenOperation(userCredential: userCredential)
        
        getTokenOperation.success = { [weak self] userCredential in
            if userCredential != nil {
                self?.userCredential = userCredential
            }
            self?.getUserDataWith(login, success, failure)
        }
        getTokenOperation.failure = { error in
            failure?(error)
        }
        
        operationQueue.addOperation(getTokenOperation)
    }

    private func getUserDataWith(_ login: String,
                                 _ success: ((UserData) -> Void)?,
                                 _ failure: ((Error?) -> Void)?
    ) {
        let getUserDataOperation = GetUserDataOperation(login, userCredential)
        
        getUserDataOperation.success = { [weak self] userData in
            self?.getImageData(userData, success, failure)
        }
        getUserDataOperation.failure = { error in
            failure?(error)
        }
        
        operationQueue.addOperation(getUserDataOperation)
    }

    private func getImageData(_ userData: UserData,
                              _ success: ((UserData) -> Void)?,
                              _ failure: ((Error?) -> Void)?
    ) {
        let getImageDataOperation = GetImageDataOperation(imageUrl: userData.imageUrl)
        
        getImageDataOperation.success = { imageData in
            var updatedUserData = userData
            updatedUserData.imageData = imageData
            success?(updatedUserData)
        }
        getImageDataOperation.failure = { error in
            failure?(error)
        }
        
        operationQueue.addOperation(getImageDataOperation)
    }
}
