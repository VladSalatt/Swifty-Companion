//
//  NetworkErrors.swift
//  Swifty-companion
//
//  Created by VKoshelev@detmir.ru on 19.09.2021.
//

import Foundation

protocol NetworkErrorProtocol: Error, CustomStringConvertible {
    var description: String { get }
}

enum NetworkErrors: NetworkErrorProtocol {
    
    /// Invalid URL
    case invalidUrl

    /// Invalid ULRSession
    case invalidSession
    
    /// Response error
    case invalidResponse

    /// Parse data error
    case invalidData

    /// 400, The request is malformed
    case invalidRequest
    
    /// 401, Unauthorized
    case unauthorized
    
    /// 403, Forbidden
    case forbidden
    
    /// 404, Page not found
    case notFound
    
    /// 422, Unprocessable entity
    case invalidEntity
    
    /// 500, We have a problem with our server. Please try again later.
    case invalidServer
    
    /// Unknown error
    case unknown
}

extension NetworkErrors {
    var description: String {
        switch self {
        case .invalidUrl:
            return "URL is invalid"
        case .invalidSession:
            return "Your code is fully shit"
        case .invalidResponse:
            return "Response error"
        case .invalidData:
            return "Parse data error"
        case .invalidRequest:
            return "The request is malformed"
        case .unauthorized:
            return "You are unauthorized"
        case .forbidden:
            return "Forbidden"
        case .notFound:
            return "User not found"
        case .invalidEntity:
            return "Unprocessable entity"
        case .invalidServer:
            return "We have a problem with our server\n Please try again later"
        case .unknown:
            return "Unknown error"
        }
    }
}
