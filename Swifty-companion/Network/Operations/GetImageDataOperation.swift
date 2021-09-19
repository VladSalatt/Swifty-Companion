//
//  GetImageDataOperation.swift
//  Swifty-companion
//
//  Created by VKoshelev@detmir.ru on 19.09.2021.
//

import Foundation

final class GetImageDataOperation: Operation {
    
    private let imageUrl: String
    
    var success: ((Data) -> Void)?
    var failure: ((Error?) -> Void)?
    
    init(imageUrl: String) {
        self.imageUrl = imageUrl
        super.init()
    }
    
    override func main() {
        guard let url = URL(string: imageUrl) else {
            failure?(NetworkErrors.invalidUrl)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                self.failure?(NetworkErrors.invalidSession)
                return
            }
            guard let response = response as? HTTPURLResponse else {
                self.failure?(NetworkErrors.invalidResponse)
                return
            }
            
            switch response.statusCode {
            case 200:
                guard let imageData = data else {
                    self.failure?(NetworkErrors.invalidData)
                    return
                }
                self.success?(imageData)
            case 400:
                self.failure?(NetworkErrors.invalidRequest)
            case 401:
                self.failure?(NetworkErrors.unauthorized)
            case 403:
                self.failure?(NetworkErrors.forbidden)
            case 404:
                self.failure?(NetworkErrors.notFound)
            case 422:
                self.failure?(NetworkErrors.invalidEntity)
            case 500:
                self.failure?(NetworkErrors.invalidServer)
            default:
                self.failure?(NetworkErrors.unknown)
            }
            
        }.resume()
    }
}
