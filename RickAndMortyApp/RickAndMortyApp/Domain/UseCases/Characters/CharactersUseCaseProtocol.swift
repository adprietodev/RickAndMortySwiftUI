//
//  CharactersUseCaseProtocol.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 19/6/24.
//

import Foundation

protocol CharactersUseCaseProtocol {
    func getCharacters(with filters: [String: Any]) async throws -> [Character]
}
