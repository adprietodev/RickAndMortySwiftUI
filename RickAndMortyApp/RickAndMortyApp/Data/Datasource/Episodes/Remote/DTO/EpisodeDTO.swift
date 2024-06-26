//
//  EpisodeDTO.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 19/6/24.
//

import Foundation

struct EpisodeDTO: Codable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let characters: [String]
    let created: String

    enum CodingKeys: String, CodingKey {
        case id, name, episode, characters, created
        case airDate = "air_date"
    }
}


