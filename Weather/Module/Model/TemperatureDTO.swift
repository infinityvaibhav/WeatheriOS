//
//  TemperatureDTO.swift
//  Weather
//
//  Created by Vaibhav Upadhyay on 06/02/23.
//

import Foundation

struct TemperatureDTO: Codable {
    let temp: Double?
    let tempMin: Double?
    
    enum WeatherDTOCodingKeys: String, CodingKey {
        case temp = "temp"
        case tempMin = "temp_min"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: WeatherDTOCodingKeys.self)
        temp = try container.decodeIfPresent(Double?.self, forKey: .temp) ?? 0
        tempMin = try container.decodeIfPresent(Double?.self, forKey: .tempMin) ?? 0
    }
}
