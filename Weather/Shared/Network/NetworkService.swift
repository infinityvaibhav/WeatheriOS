//
//  NetworkService.swift
//  Weather
//
//  Created by Vaibhav Upadhyay on 04/02/23.
//

import Foundation

enum NetworkError: Error {
    case decodeError
    case domainError
    case urlError
    case noData
}

struct Resource<T: Codable> {
    let url: URL
}

class NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}
    
    func request<T>(resource: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(.failure(.domainError))
                return
            }
            
            let result = try? JSONDecoder().decode(T.self, from: data)
            if let result = result {
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } else {
                completion(.failure(.decodeError))
            }
            
        }.resume()
        
    }
}

