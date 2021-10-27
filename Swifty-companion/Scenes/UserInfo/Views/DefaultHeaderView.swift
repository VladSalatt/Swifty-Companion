//
//  DefaultHeaderView.swift
//  Swifty-companion
//
//  Created by VKoshelev@detmir.ru on 20.10.2021.
//

import UIKit

class DefaultHeaderView: UIView {
    
    let contentView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .transColor
        view.layer.cornerRadius = 15
        
        return view
    }()
    
    let label: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 21)
        label.textAlignment = .left
        label.textColor = .white
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        setupUI()
    }
    
    private func setupUI() {
        addSubview(contentView)
        contentView.addSubview(label)
        makeConstraints()
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
        ])
    }
}
