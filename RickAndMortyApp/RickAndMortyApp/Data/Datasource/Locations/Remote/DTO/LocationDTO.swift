//
//  LocationsDTO.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 19/6/24.
//

import Foundation

struct LocationDTO: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let created: String
}
