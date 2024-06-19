//
//  Episode.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 19/6/24.
//

import Foundation

class Episode {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let characters: [Int]
    let created: String
    var isFavorite: Bool
    
    init(id: Int, name: String, airDate: String, episode: String, characters: [Int], created: String) {
        self.id = id
        self.name = name
        self.airDate = airDate
        self.episode = episode
        self.characters = characters
        self.created = created
        self.isFavorite = false
    }
}
