//
//  UserData.swift
//  Swifty-companion
//
//  Created by VKoshelev@detmir.ru on 18.09.2021.
//

import Foundation

struct UserData: Codable {
    enum CodingKeys: String, CodingKey {
        case email
        case login
        case displayName = "displayname"
        case imageUrl = "image_url"
        case imageData
        case correctionPoint = "correction_point"
        case wallet
        case cursusUsers = "cursus_users"
        case projectsUsers = "projects_users"
        case campus
    }
    
    let email: String
    let login: String
    let displayName: String
    let imageUrl: String
    var imageData: Data?
    let correctionPoint: Int
    let wallet: Int
    let cursusUsers: [CursusUser]
    let projectsUsers: [ProjectsUsers]
    let campus: [Campus]
}

// Cursus User

struct CursusUser: Codable {
    let level: Double
    let skills: [Skills]
    let cursus: Cursus
}

struct Skills: Codable {
    enum CodingKeys: String, CodingKey {
        case name
        case level
    }
    
    let name: String
    let level: Double
}

struct Cursus: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
    
    let id: Int
    let name: String
}

// Projects Users
public struct ProjectsUsers: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case finalMark = "final_mark"
        case status
        case validated = "validated?"
        case project
        case cursusIds = "cursus_ids"
    }

    let id: Int
    let finalMark: Int?
    let status: String
    let validated: Bool?
    let project: Project
    let cursusIds: [Int]
    var children = [ProjectsUsers]()
}

public struct Project: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case parentId = "parent_id"
    }

    let id: Int
    let name: String
    let parentId: Int?
}

// Campus

public struct Campus: Codable {
    enum CodingKeys: String, CodingKey {
        case name
    }

    let name: String
}
