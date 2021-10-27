//
//  SkillTableViewCell.swift
//  Swifty-companion
//
//  Created by VKoshelev@detmir.ru on 20.10.2021.
//

import UIKit

final class SkillTableViewCell: UITableViewCell {

    static let id = "skillId"
    
    let label: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17)
        label.textColor = .white
        label.textAlignment = .left
        label.setContentHuggingPriority(.required, for: .horizontal)
        
        return label
    }()
    
    let marklabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17)
        label.textColor = .white
        label.textAlignment = .right
        
        return label
    }()
    
    let progressView: UIProgressView = {
        let view = UIProgressView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.cornerRadius = 2
        view.progressTintColor = .primaryGreen
        view.clipsToBounds = true
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: SkillTableViewCell.id)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        backgroundColor = .transColor
        
        contentView.addSubview(label)
        contentView.addSubview(marklabel)
        contentView.addSubview(progressView)
        
        contentView.layoutMargins = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            
            marklabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            marklabel.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 10),
            marklabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            
            progressView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 15),
            progressView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            progressView.centerXAnchor.constraint(equalTo: contentView.layoutMarginsGuide.centerXAnchor)
        ])
    }
}
