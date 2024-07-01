//
//  CharactersRepositoryProtocol.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 19/6/24.
//

import Foundation

protocol CharactersRepositoryProtocol {
    func getCharacters(with filters: [String: Any]) async throws -> [Character]
    func getFavouriteCharactersIDs() throws -> [Int]
    func setFavoriteCharacter(character: Character) throws
    func getCountOfTotalCharacters(with filters: [String: Any]) async throws -> Int
}
