//
//  EpisodesPaginationDTO.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 19/6/24.
//

import Foundation

struct EpisodesPaginationDTO: Codable {
    let info: InfoDTO
    let results: [EpisodeDTO]
}
