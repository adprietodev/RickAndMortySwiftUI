//
//  Character.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 19/6/24.
//

import SwiftUI
import Combine

struct Character: Identifiable {
    let id: Int
    let name: String
    let status: Constants.Status
    let species: String
    let type: String
    let gender: Constants.Gender
    let origin: Location
    let location: Location
    let image: String
    let episodes: [Int]
    let created: String
    var isFavorite: Bool = false

    init(id: Int, name: String, status: Constants.Status, species: String, type: String, gender: Constants.Gender, origin: Location, location: Location, image: String, episodes: [Int], created: String) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episodes = episodes
        self.created = created
    }
}

