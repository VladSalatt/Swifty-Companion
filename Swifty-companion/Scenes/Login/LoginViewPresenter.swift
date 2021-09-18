//
//  LoginViewPresenter.swift
//  Swifty-companion
//
//  Created by VKoshelev@detmir.ru on 10.09.2021.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func showAlertWith(_ message: String)
}

final class LoginViewPresenter {
    private let networkService: NetworkService
    private let navigationController: UINavigationController?
    var delegate: LoginViewDelegate?
    
    init(with networkService: NetworkService, navigationController: UINavigationController?) {
        self.networkService = networkService
        self.navigationController = navigationController
    }
    
    func searchProfile(with login: String) {
        
        networkService.getProfileWith(login)
        
        // NSError delete or refactor
//        delegate?.showAlertWith("error")
    }
    
    private func openUserInfoScreenWith(_ data: Data?, navigationController: UINavigationController) {
        let vc = UserInfoViewController()
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}
