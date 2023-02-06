//
//  APIService.swift
//  Weather
//
//  Created by Vaibhav Upadhyay on 04/02/23.
//

import Foundation

class ApiService {
    
    func fetchWeatherList(city: String, completion: @escaping (Result<BaseDTO?, NetworkError>) -> Void) {
        let urlWithKey = API.baseUrl + "?q=" + city + "&appid=" + API.APIKey
        guard let url = URL(string: urlWithKey) else { return}
        let resource = Resource<BaseDTO>(url: url)
        
        NetworkService.shared.request(resource: resource) { result in
            switch result {
            case .success(let data):
                print(data)
                completion(.success(data))
            case .failure(let error):
                print(error)
                completion(.failure(.noData))
            }
        }
    }
}


