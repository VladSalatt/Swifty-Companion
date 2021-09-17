//
//  LoginViewPresenter.swift
//  Swifty-companion
//
//  Created by VKoshelev@detmir.ru on 10.09.2021.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    
}

final class LoginViewPresenter: LoginViewDelegate {
    private let networkService: NetworkService
    private let navigationController: UINavigationController?
    
    init(with networkService: NetworkService, navigationController: UINavigationController?) {
        self.networkService = networkService
        self.navigationController = navigationController
    }
    
    public func searchProgile(with login: String) {
        
    }
    
    private func openUserInfoScreenWith(_ data: Data?, navigationController: UINavigationController) {
        let vc = UserInfoViewController()
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}
