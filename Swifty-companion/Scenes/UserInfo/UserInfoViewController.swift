//
//  UserInfoViewController.swift
//  Swifty-companion
//
//  Created by VKoshelev@detmir.ru on 04.09.2021.
//

import UIKit

final class UserInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}
