//
//  UserData.swift
//  Swifty-companion
//
//  Created by VKoshelev@detmir.ru on 18.09.2021.
//

import Foundation

struct UserData: Decodable {
    enum CodingKeys: String, CodingKey {
        case email
        case login
        case displayName = "displayname"
        case imageUrl = "image_url"
        case imageData
        case correctionPoint = "correction_point"
        case wallet
//        case cursusUsers = "cursus_users"
//        case projectsUsers = "projects_users"
//        case campus
    }
    
    let email: String
    let login: String
    let displayName: String
    let imageUrl: String
    var imageData: Data?
    let correctionPoint: Int
    let wallet: Int
//    let cursusUsers:
//    let projectsUsers:
//    let campus:
}
