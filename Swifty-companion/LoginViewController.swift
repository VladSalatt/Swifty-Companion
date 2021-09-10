//
//  ViewController.swift
//  Swifty-companion
//
//  Created by VKoshelev@detmir.ru on 04.09.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    private enum Constants {
        enum Assets {
            static let logo = "logo"
            static let background = "background"
        }
    }
    
    // MARK: - UI
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: Constants.Assets.logo)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .gray
        
        textField.font = .boldSystemFont(ofSize: 18)
        textField.textColor = .white
        textField.tintColor = .white
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.placeholder = "Enter nickname"
        
        textField.clearButtonMode = .always
        textField.returnKeyType = .search
        
        textField.borderStyle = .roundedRect
        textField.contentVerticalAlignment = .center
        textField.textAlignment = .center
        
        textField.alpha = 0.7
        
        // mb delete lazy and delegate here
        textField.delegate = self
        return textField
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("SEARCH", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.gray, for: .selected)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        button.backgroundColor = .gray
        button.alpha = 0.7
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var textStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [searchTextField, searchButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 10
        return stack
    }()
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(patternImage: UIImage(named: Constants.Assets.background)!)
        
        view.addSubview(logoImageView)
        view.addSubview(textStackView)
        
        makeConstraints()
    }

    private func makeConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.bottomAnchor.constraint(equalTo: textStackView.topAnchor, constant: -90),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            textStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 90),
            textStackView.heightAnchor.constraint(equalToConstant: 100),
            textStackView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    // MARK: - Selectors
    
    @objc private func searchButtonTapped() {
        let vc = UserInfoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - TextField Delegate

extension LoginViewController: UITextFieldDelegate {
}
