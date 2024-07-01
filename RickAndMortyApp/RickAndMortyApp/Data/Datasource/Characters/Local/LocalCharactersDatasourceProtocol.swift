//
//  LocalCharactersDatasourceProtocol.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 21/6/24.
//

import Foundation

protocol LocalCharactersDatasourceProtocol {
    func getFavouriteCharactersIDs() throws -> [Int]
    func setFavoriteCharacter(character: Character) throws
}
