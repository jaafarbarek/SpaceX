//
//  Rocket.swift
//  SpaceX
//
//  Created by Jaafar Barek on 25/03/2021.
//

import Foundation

struct Rocket: Decodable {
    let id: String?
    let name: String?
    let description: String?
    let wikipedia: String?
    let images: [String]?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case wikipedia
        case images = "flickr_images"
    }
}

