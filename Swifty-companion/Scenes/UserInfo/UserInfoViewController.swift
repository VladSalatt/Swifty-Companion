//
//  UserInfoViewController.swift
//  Swifty-companion
//
//  Created by VKoshelev@detmir.ru on 04.09.2021.
//

import UIKit

final class UserInfoViewController: UITableViewController {
    
    // MARK: - Properties
    
    private let userData: UserData!
    
    // MARK: - Init
    
    init(userData: UserData) {
        self.userData = userData
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Таким способом НавБар начинает отображатсья сразу
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        // Таким способом НавБар начинает сразу скрыватсья
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // MARK: - Private Methods
    
    private func setupTableView() {
        
    }
}
