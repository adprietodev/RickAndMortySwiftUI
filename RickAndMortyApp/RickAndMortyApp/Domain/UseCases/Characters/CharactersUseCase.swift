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
        try await repository.getCharacters(with: filters)
    }
}
