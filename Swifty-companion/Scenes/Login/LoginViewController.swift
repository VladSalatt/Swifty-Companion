//
//  ViewController.swift
//  Swifty-companion
//
//  Created by VKoshelev@detmir.ru on 04.09.2021.
//

import UIKit

final class LoginViewController: UIViewController {
    
    private enum Constants {
        enum Assets {
            static let logo = "logo"
            static let background = "background"
        }
        
        enum Color {
            static let primaryGreen = UIColor(red: 0/255, green: 255/255, blue: 177/255, alpha: 1.0)
        }
    }

    private lazy var presenter = LoginViewPresenter(with: NetworkService(),
                                                    navigationController: self.navigationController)
    
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
        
        textField.clearButtonMode = .never
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
        
        button.backgroundColor = Constants.Color.primaryGreen
        button.alpha = 1.0
        button.layer.cornerRadius = 5
        
        button.isEnabled = false
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
        configureKeyboard()
        makeConstraints()
        presenter.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        searchTextField.text = nil
        searchButton.isEnabled = false
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(patternImage: UIImage(named: Constants.Assets.background)!)
        
        view.addSubview(logoImageView)
        view.addSubview(textStackView)
        
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
    
    func configureKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - Selectors
    
    // call the network request
    @objc private func searchButtonTapped() {
        guard let login = searchTextField.text else { return }
        presenter.searchProfile(with: login)
    }
    
    @objc private func dismissKeyboard() {
        searchTextField.resignFirstResponder()
    }
    
    private func configureButtonWith() {
        guard let inputText = searchTextField.text else { return }
        searchButton.isEnabled = !inputText.isEmpty
    }
}

// MARK: - TextField Delegate

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        configureButtonWith()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        configureButtonWith()
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        configureButtonWith()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        configureButtonWith()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        searchButtonTapped()
        return true
    }
}

// MARK: - LoginView Delegate

extension LoginViewController: LoginViewDelegate {
    func showAlertWith(_ message: String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
