//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Vaibhav Upadhyay on 05/02/23.
//

import Foundation

class  WeatherViewModel {
    
    private var baseDTO: BaseDTO?
    
    func fetchWeather(city: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        ApiService().fetchWeatherList(city: city) { result in
            switch result {
            case .success(let data):
                self.baseDTO = data
                completion(.success(true))
            case .failure(let error):
                print(error)
                completion(.failure(error))
            }
            
        }
    }
    
    var tempMonday: String? {
        "\(String(describing: baseDTO?.list?[0].main?.temp ?? 0))"
    }
    
    var tempTuesday: String? {
        "\(String(describing: baseDTO?.list?[1].main?.temp ?? 0))"
    }
    
    var tempWednesday: String? {
        "\(String(describing: baseDTO?.list?[2].main?.temp ?? 0))"
    }
    
    var tempThursday: String? {
        "\(String(describing: baseDTO?.list?[3].main?.temp ?? 0))"
    }
    
    var tempFriday: String? {
        "\(String(describing: baseDTO?.list?[4].main?.temp ?? 0))"
    }
    
    var weatherMonday: String? {
        baseDTO?.list?[0].weather?[0].main
    }
    
    var weatherTuesday: String? {
        baseDTO?.list?[1].weather?[0].main
    }
    
    var weatherWednesday: String? {
        baseDTO?.list?[2].weather?[0].main
    }
    
    var weatherThursday: String? {
        baseDTO?.list?[3].weather?[0].main
    }
    
    var weatherFriday: String? {
        baseDTO?.list?[4].weather?[0].main
    }
    
    var city: String? {
        baseDTO?.city?.name
    }
    
}
