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
        characters.forEach {
            if favouritesIDs.contains($0.id) {
                $0.isFavorite = true
            }
        }
        return characters
    }
    
    func setFavoriteCharacter(by id: Int, isFavourite: Bool) throws {
        try repository.setFavoriteCharacter(by: id, isFavourite: isFavourite)
    }
}
