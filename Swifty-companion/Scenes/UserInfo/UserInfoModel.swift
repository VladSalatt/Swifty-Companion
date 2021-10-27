//
//  UserInfoModel.swift
//  Swifty-companion
//
//  Created by VKoshelev@detmir.ru on 20.10.2021.
//

import Foundation

struct UserInfoModel {
    var email: String
    var login: String
    var displayName: String
    var imageData: Data?
    var correctionPoint: Int
    var wallet: Int
    var campusName: String
}

struct CursusData {
    var level: Double
    var skills: [Skills]
    var cursus: Cursus
    var projects: [ProjectsUsers]
}
