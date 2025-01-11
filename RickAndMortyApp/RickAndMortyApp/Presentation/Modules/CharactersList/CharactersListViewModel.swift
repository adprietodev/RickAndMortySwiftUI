//
//  CharactersListViewModel.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 18/6/24.
//

import SwiftUI
import Combine

class CharactersListViewModel: ObservableObject, CharacterFavouriteDelegate {
    let charactersUseCase: CharactersUseCaseProtocol

    @Published var mainFilters = [String: Any]()
    @Published var characters = [Character]()
    @Published var filteredCharacters = [Character]()
    @Published var isLoading: Bool = false
    @Published var isFiltering:  Bool = false
    @Published var hasAdditionalFilters: Bool = false

    private var currentPage: Int = 1
    private var filteredPage: Int = 1
    
    init(charactersUseCase: CharactersUseCaseProtocol) {
        self.charactersUseCase = charactersUseCase
        mainFilters.updateValue("\(currentPage)", forKey: Constants.QueryParams.page.rawValue)
        setCharacters()
    }

    func setCharacters() {
        Task {
            do {
                let newCharacters = try await charactersUseCase.getCharacters(with: mainFilters)
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    self.characters += newCharacters
                    self.isLoading = false
                }
            } catch {
                self.isLoading = false
            }
        }
    }

    
    @MainActor
    func setFilteredCharacters() {
        Task {
            do {
                let newCharacters: [Character]
                if filteredPage == 1 {
                    newCharacters = try await charactersUseCase.getCharacters(with: mainFilters)
                    self.filteredCharacters = newCharacters
                } else {
                    newCharacters = try await charactersUseCase.getCharacters(with: mainFilters)
                    self.filteredCharacters += newCharacters
                }
                self.isLoading = false
            } catch {
                self.isLoading = false
                print(error)
            }
        }
    }


    @MainActor
    func checkAdditionalFilters() {
        hasAdditionalFilters = mainFilters.containsAdditionalFilter(keys: [
            Constants.QueryParams.gender.rawValue,
            Constants.QueryParams.species.rawValue,
            Constants.QueryParams.status.rawValue,
            Constants.QueryParams.type.rawValue,
        ])
        
        
        isFiltering = hasAdditionalFilters || mainFilters.keys.contains(Constants.QueryParams.name.rawValue)

        if hasAdditionalFilters {
            setFilteredCharacters()
        }
    }

    @MainActor
    func searchByName(_ name: String) {
        filteredPage = 1
        if name.isEmpty {
            mainFilters[Constants.QueryParams.page.rawValue] = currentPage
            mainFilters.removeValue(forKey: Constants.QueryParams.name.rawValue)
        } else {
            mainFilters[Constants.QueryParams.page.rawValue] = "\(filteredPage)"
            mainFilters.updateValue(name, forKey: Constants.QueryParams.name.rawValue)
            setFilteredCharacters()
        }
    }

    func updateFavourite(character: Character) {
        do {
            if isFiltering {
                guard let indexCharacter = filteredCharacters.firstIndex(where: { $0.id == character.id }) else { return }
                filteredCharacters[indexCharacter].isFavorite.toggle()
                if let originalIndex = characters.firstIndex(where: { $0.id == character.id })  {
                    characters[originalIndex].isFavorite = filteredCharacters[indexCharacter].isFavorite
                }
                try charactersUseCase.setFavoriteCharacter(character: filteredCharacters[indexCharacter])
            } else {
                guard let indexCharacter = characters.firstIndex(where: { $0.id == character.id }) else { return }
                characters[indexCharacter].isFavorite.toggle()
                try charactersUseCase.setFavoriteCharacter(character: characters[indexCharacter])
            }
        } catch {
        }
    }

    @MainActor
    func loadNewPage() {
        if isFiltering {
            filteredPage += 1
            mainFilters[Constants.QueryParams.page.rawValue] = "\(filteredPage)"
            setFilteredCharacters()
        } else {
            currentPage += 1
            mainFilters[Constants.QueryParams.page.rawValue] = "\(currentPage)"
            setCharacters()
        }
        isLoading = true
    }

    @MainActor
    func updateFilters(newFilters: [String: Any]) {
        let specialQuery: [Constants.QueryParams] = [.gender,.species,.status,.type]
        
        mainFilters.merge(newFilters) { (_,new) in new }
        
        specialQuery.forEach {
            if !newFilters.keys.contains($0.rawValue) {
                mainFilters.removeValue(forKey: $0.rawValue)
            }
        }

        checkAdditionalFilters()
    }
}

extension CharactersListViewModel: FilterCellDellegate {
    @MainActor
    func removeFilter(with key: String) {
        mainFilters.removeValue(forKey: key)
        filteredPage = 1
        mainFilters[Constants.QueryParams.page.rawValue] = filteredPage
        checkAdditionalFilters()
    }
    
}
