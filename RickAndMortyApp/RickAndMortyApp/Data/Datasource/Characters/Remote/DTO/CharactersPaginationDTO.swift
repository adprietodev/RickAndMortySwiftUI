//
//  CharactersPagination.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 19/6/24.
//

import Foundation

struct CharactersPaginationDTO: Codable {
    var info: InfoDTO
    var results: [CharacterDTO]
}
