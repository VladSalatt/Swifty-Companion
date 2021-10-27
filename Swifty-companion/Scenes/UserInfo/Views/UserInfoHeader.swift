//
//  UserInfoHeader.swift
//  Swifty-companion
//
//  Created by VKoshelev@detmir.ru on 19.09.2021.
//

import UIKit

final class UserInfoHeader: UIView {
    
    // MARK: - Profile
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layoutMargins = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        return view
    }()
    
    let displayName: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .left
        return label
    }()
    
    let wallet: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 17)
        label.textAlignment = .left
        return label
    }()
    
    let evaluationPoints: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 17)
        label.textAlignment = .left
        return label
    }()
    
    let cursusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 17)
        label.setContentHuggingPriority(.required, for: .horizontal)
        label.textAlignment = .left
        return label
    }()
    
    let cursusButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.backgroundColor = .black
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var cursusStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [cursusLabel, cursusButton])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.spacing = 10
        sv.distribution = .fill
        sv.alignment = .fill
        return sv
    }()
    
    private lazy var VStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [displayName, wallet, evaluationPoints, cursusStackView])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = 15
        sv.distribution = .equalSpacing
        sv.alignment = .fill
        return sv
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10

        imageView.setContentHuggingPriority(.required, for: .horizontal)
        imageView.setContentHuggingPriority(.required, for: .vertical)
        imageView.setContentCompressionResistancePriority(.required, for: .horizontal)
        imageView.setContentCompressionResistancePriority(.required, for: .vertical)
        return imageView
    }()
    
    private lazy var profileStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [imageView, VStackView])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.spacing = 15
        sv.alignment = .fill
        sv.distribution = .fill
        return sv
    }()
    
    // MARK: - Level, Mail, Campus
    
    lazy var progressViewLevel: UIProgressView = {
        let pr = UIProgressView(progressViewStyle: .default)
        pr.translatesAutoresizingMaskIntoConstraints = false
        pr.layer.cornerRadius = 15
        pr.backgroundColor = .black
        
        //
        pr.progressTintColor = .primaryGreen
        pr.progress = 0.5
        pr.clipsToBounds = true
        return pr
    }()
    
    let levelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        
        //
        label.text = "level"
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    
    let mailImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "envelope")
        image.contentMode = .scaleAspectFit
        image.setContentHuggingPriority(.required, for: .horizontal)
        return image
    }()
    
    let mailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17)
        label.textColor = .white
        return label
    }()
    
    private lazy var mailStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [mailImage, mailLabel])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.spacing = 5
        sv.alignment = .fill
        sv.distribution = .fill
        return sv
    }()
    
    let campusImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "mappin.and.ellipse")
        imageView.contentMode = .scaleAspectFit
        imageView.setContentHuggingPriority(.required, for: .horizontal)
        return imageView
    }()
    
    let campusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17)
        label.textColor = .white
        return label
    }()
    
    private lazy var campusStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [campusImage, campusLabel])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.spacing = 5
        sv.alignment = .fill
        sv.distribution = .fill
        return sv
    }()
    
    private lazy var bottomStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [progressViewLevel, mailStackView, campusStackView])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = 15
        sv.distribution = .equalSpacing
        sv.alignment = .fill
        return sv
    }()
    
    
    var buttonAction: (() -> Void)!
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        makeConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        addSubview(contentView)
        
        contentView.addSubview(profileStackView)
        contentView.addSubview(bottomStackView)
        
        progressViewLevel.addSubview(levelLabel)
    }
    
    private func makeConstrains() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            profileStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            profileStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 128),
            
            bottomStackView.topAnchor.constraint(equalTo: profileStackView.bottomAnchor, constant: 25),
            bottomStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bottomStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bottomStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            mailImage.heightAnchor.constraint(equalTo: mailImage.widthAnchor),
            
            campusImage.widthAnchor.constraint(equalTo: mailImage.widthAnchor),
            campusImage.heightAnchor.constraint(equalTo: mailImage.heightAnchor),
            
            levelLabel.centerXAnchor.constraint(equalTo: progressViewLevel.centerXAnchor),
            levelLabel.centerYAnchor.constraint(equalTo: progressViewLevel.centerYAnchor),
            
            progressViewLevel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    @objc private func buttonTap() {
        buttonAction()
    }
}
