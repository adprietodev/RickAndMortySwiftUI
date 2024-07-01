//
//  CharactersUseCase.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 19/6/24.
//

import Foundation

class CharactersUseCase: CharactersUseCaseProtocol {
    // MARK: - Properties
    let repository: CharactersRepositoryProtocol

    init(repository: CharactersRepositoryProtocol) {
        self.repository = repository
    }

    // MARK: - Functions
    func getCharacters(with filters: [String: Any]) async throws -> [Character] {
        var characters = try await repository.getCharacters(with: filters)
        let favouritesIDs = try repository.getFavouriteCharactersIDs()
        characters.enumerated().forEach { (index, character) in
            if favouritesIDs.contains(character.id) {
                characters[index].isFavorite = true
            }
        }
        return characters
    }

    func getCountOfTotalCharacters(with filters: [String: Any]) async throws -> Int {
        try await repository.getCountOfTotalCharacters(with: filters)
    }
    
    func setFavoriteCharacter(by id: Int, isFavourite: Bool) throws {
        try repository.setFavoriteCharacter(by: id, isFavourite: isFavourite)
    }
}
