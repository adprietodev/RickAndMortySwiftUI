//
//  CharactersRepository.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 19/6/24.
//

import Foundation

// TODO: - Protocol
class CharactersRepository {
    // MARK: - Properties
    let charactersDatasource: CharactersDatasourceProtocol

    init(charactersDatasource: CharactersDatasourceProtocol) {
        self.charactersDatasource = charactersDatasource
    }

    // MARK: - Functions
    // TODO: - Entity Character
    func getCharacters(with filters: [String: Any]) async throws  {
        let charactersDTO = try await charactersDatasource.getCharacters(with: filters)
        // TODO: - toDomain
        // TODO: - Return character
    }
}
