//
//  LoginViewPresenter.swift
//  Swifty-companion
//
//  Created by VKoshelev@detmir.ru on 10.09.2021.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func showAlertWith(message: String)
    var activityIndicator: UIActivityIndicatorView { get }
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
        
        networkService.getProfileWith(login) { [weak self] userData in
            self?.openUserInfoScreenWith(userData)
        } failure: { [weak self] error in
            let err = error != nil ? error as! NetworkErrors : NetworkErrors.unknown
            self?.delegate?.showAlertWith(message: err.description)
        }
    }
    
    private func openUserInfoScreenWith(_ data: UserData) {
        DispatchQueue.main.async {
            self.delegate?.activityIndicator.stopAnimating()
            let vc = UserInfoViewController(userData: data)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

