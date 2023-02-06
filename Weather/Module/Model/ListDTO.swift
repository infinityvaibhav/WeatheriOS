//
//  ListDTO.swift
//  Weather
//
//  Created by Vaibhav Upadhyay on 06/02/23.
//

import Foundation

struct ListDTO: Codable {
    let main: TemperatureDTO?
    let weather: [WeatherDTO]?
    
    enum ListDTOCodingKeys: String, CodingKey {
        case main = "main"
        case weather = "weather"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ListDTOCodingKeys.self)
        main = try container.decodeIfPresent(TemperatureDTO.self, forKey: .main)
        weather = try container.decodeIfPresent([WeatherDTO]?.self, forKey: .weather) ?? [WeatherDTO]()
    }
}
