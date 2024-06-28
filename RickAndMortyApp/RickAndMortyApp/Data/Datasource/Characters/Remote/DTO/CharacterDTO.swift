//
//  CharacterDTO.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 19/6/24.
//

import Foundation

struct CharacterDTO: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: CharacterLocationDTO
    let location: CharacterLocationDTO
    let image: String
    let episode: [String]?
    let created: String
}
