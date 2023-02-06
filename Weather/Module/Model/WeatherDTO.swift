//
//  WeatherDTO.swift
//  Weather
//
//  Created by Vaibhav Upadhyay on 06/02/23.
//

import Foundation

struct WeatherDTO: Codable {
    let main: String?
    let description: String?
    
    enum WeatherDTOCodingKeys: String, CodingKey {
        case main = "main"
        case description = "description"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: WeatherDTOCodingKeys.self)
        main = try container.decodeIfPresent(String.self, forKey: .main) ?? ""
        description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
    }
}
