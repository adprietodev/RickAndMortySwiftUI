//
//  LocationsPaginationDTO.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 19/6/24.
//

import Foundation

struct LocationsPaginationDTO: Codable {
    let info: InfoDTO
    let results: [LocationDTO]
}
