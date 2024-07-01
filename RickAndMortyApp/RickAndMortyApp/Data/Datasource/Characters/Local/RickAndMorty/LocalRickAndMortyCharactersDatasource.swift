//
//  LocalRickAndMortyCharactersDatasource.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 21/6/24.
//

import Foundation

class LocalRickAndMortyCharactersDatasource: LocalCharactersDatasourceProtocol {
    func getFavouriteCharactersIDs() throws -> [Int] {
        if let data = UserDefaults.standard.data(forKey: "favouriteCharactersIDs") {
            let decoder = JSONDecoder()
            return try decoder.decode([Int].self, from: data)
        }
        return []
    }

    func setFavoriteCharacter(character: Character) throws {
        var favouriteIDs = try getFavouriteCharactersIDs()
        
        if character.isFavorite {
            if !favouriteIDs.contains(character.id) {
                favouriteIDs.append(character.id)
            }
        } else {
            if let index = favouriteIDs.firstIndex(of: character.id) {
                favouriteIDs.remove(at: index)
            }
        }

        let encoder = JSONEncoder()
        let data = try encoder.encode(favouriteIDs)
        UserDefaults.standard.set(data, forKey: "favouriteCharactersIDs")
    }
}
