//
//  ProjectTableViewCell.swift
//  Swifty-companion
//
//  Created by VKoshelev@detmir.ru on 20.10.2021.
//

import UIKit

final class ProjectTableViewCell: UITableViewCell {

    static let id = "projectCell"
    
    let label: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17)
        label.textColor = .white
        label.textAlignment = .left
        label.setContentHuggingPriority(.required, for: .horizontal)
        
        return label
    }()
    
    let markLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17)
        label.textColor = .white
        label.textAlignment = .right
        
        return label
    }()
    
    let clockImage: UIImageView = {
        let iv = UIImageView()
        
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(systemName: "clock")?.withTintColor(.yellow, renderingMode: .alwaysTemplate)
        
        return iv
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: ProjectTableViewCell.id)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        backgroundColor = .transColor
        
//        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        contentView.addSubview(markLabel)
        contentView.addSubview(clockImage)
        makeConstraints()
    }
    
    private func makeConstraints() {
        contentView.layoutMargins = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            
            markLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            markLabel.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 10),
            markLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            
            clockImage.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            clockImage.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            clockImage.heightAnchor.constraint(equalToConstant: 24),
            clockImage.widthAnchor.constraint(equalToConstant: 24),
        ])
    }
}
