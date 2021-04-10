//
//  APIManager.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//

import Foundation
import Combine

class APIManager {
    
    static var defaultHeaders: NSMutableDictionary = [
        "Content-Type": "application/json"
    ]

}

// MARK: - Data Request Methods
extension APIManager {
    
    static func request<T: Codable>(service: APIRouter) -> AnyPublisher<T, Error> {
        guard let request = service.request else {
            let error = NSError(domain: "error", code: 404, userInfo: [NSLocalizedDescriptionKey: "Bad URL"])
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: RunLoop.main)
            .map { (data: Data, response: URLResponse) in
                guard let response = String(data: data, encoding: .utf8) else { return data }
                print(response)
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}
