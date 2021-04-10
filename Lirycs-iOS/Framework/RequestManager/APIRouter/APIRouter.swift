//
//  APIRouter.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//

import Foundation

enum APIRouter {
    
    case Lyrics([String: String])
    
    private var method: HTTPMethod {
        switch self {
        case .Lyrics:
            return .GET
        }
    }
    
    private var path: String {
        switch self {
        case .Lyrics(let parameters):
            let artist = parameters["artist"] ?? ""
            let title = parameters["title"] ?? ""
            return "\(artist)/\(title)"
        }
    }
    
    private var url: String {
        APIManagerConstants.endpoint
    }
    
    private var urlRequest: URLRequest? {
        guard let url = URL(string: url) else {
            return nil
        }
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = APIManager.defaultHeaders as? [String: String]
        return urlRequest
    }
    
    private var nsUrlRequest: URLRequest? {
        guard let nsUrl = NSURL(string: self.url + path) else {
            return nil
        }
        var urlRequest = URLRequest(url: nsUrl as URL)
        urlRequest.httpMethod = method.rawValue
        //urlRequest.allHTTPHeaderFields = APIManager.defaultHeaders as? [String: String]
        return urlRequest
    }
    
    var request: URLRequest? {
        switch self {
        case .Lyrics:
            return urlRequest
        }
    }
    
}
