//
//  UserInfoPresenter.swift
//  Swifty-companion
//
//  Created by VKoshelev@detmir.ru on 22.10.2021.
//

import Foundation

final class UserInfoPresenter {    
    func dataConfigure(_ data: UserData) -> (UserInfoModel, [CursusData]) {
        let userInfoModel = UserInfoModel(
                email: data.email,
                login: data.login,
                displayName: data.displayName,
                imageData: data.imageData,
                correctionPoint: data.correctionPoint,
                wallet: data.wallet,
                campusName: data.campus.first?.name ?? "Unknown"
            )
        var cursusData = [CursusData]()
        
        data.cursusUsers.forEach { cursus in
            var projects = [ProjectsUsers]()
            
            data.projectsUsers.forEach { project in
                if project.cursusIds.contains(cursus.cursus.id) {
                    projects.append(project)
                }
            }
            
            let course = CursusData(
                    level: cursus.level,
                    skills: cursus.skills,
                    cursus: cursus.cursus,
                    projects: projects
            )
            cursusData.append(course)
        }
        
        return (userInfoModel, cursusData)
    }
}
