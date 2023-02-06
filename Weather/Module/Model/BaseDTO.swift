//
//  BaseDTO.swift
//  Weather
//
//  Created by Vaibhav Upadhyay on 06/02/23.
//

import Foundation

struct BaseDTO: Codable {
    let code: String?
    let city: CityDTO?
    let list: [ListDTO]?
    
    enum BaseDTOCodingKeys: String, CodingKey {
        case code = "cod"
        case city = "city"
        case list = "list"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: BaseDTOCodingKeys.self)
        code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
        city = try container.decodeIfPresent(CityDTO.self, forKey: .city)
        list = try container.decodeIfPresent([ListDTO].self, forKey: .list) ?? [ListDTO]()
    }
}
