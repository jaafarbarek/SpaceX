//
//  Launch.swift
//  SpaceX
//
//  Created by Jaafar Barek on 25/03/2021.
//

import Foundation

struct Launch: Decodable {
    let name: String?
    let details: String?
    let upcoming: Bool?
    let rocket: String?
    let date: String?
    
    let flightNumber: Int?
    
    enum CodingKeys: String, CodingKey {
        case name
        case details
        case upcoming
        case rocket
        case date = "date_utc"
        case flightNumber = "flight_number"
    }
}
