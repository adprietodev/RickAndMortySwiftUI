//
//  CharactersListViewModel.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 18/6/24.
//

import Foundation

@Observable
class CharactersListViewModel: CharactersListViewModelProtocol {
    let charactersUseCase: CharactersUseCaseProtocol
    var filters = [String: Any]()
    var characters = [Character]()
    
    init(charactersUseCase: CharactersUseCaseProtocol) {
        self.charactersUseCase = charactersUseCase
        filters.updateValue("1", forKey: "page")
        getCharacters()
    }

    func getCharacters() {
        Task {
            do {
                characters = try await charactersUseCase.getCharacters(with: filters)
            } catch {
                print(error)
            }
        }
    }
}
