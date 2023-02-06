//
//  CityDTO.swift
//  Weather
//
//  Created by Vaibhav Upadhyay on 06/02/23.
//

import Foundation

struct CityDTO: Codable {
    let name: String?
    
    enum WeatherDTOCodingKeys: String, CodingKey {
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: WeatherDTOCodingKeys.self)
        name = try container.decodeIfPresent(String?.self, forKey: .name) ?? ""
    }
}
