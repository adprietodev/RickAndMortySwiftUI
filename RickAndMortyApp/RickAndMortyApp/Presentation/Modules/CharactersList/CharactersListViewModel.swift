//
//  CharactersListViewModel.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 18/6/24.
//

import SwiftUI

@Observable
class CharactersListViewModel: CharactersListViewModelProtocol {
    let charactersUseCase: CharactersUseCaseProtocol
    var mainFilters = [String: Any]()
    var characters = [Character]()
    var filteredCharacters = [Character]()
    var isLoading: Bool = false
    private var currentPage: Int = 1
    private var filteredPage: Int = 1
    var isFiltering: Bool = false
    
    init(charactersUseCase: CharactersUseCaseProtocol) {
        self.charactersUseCase = charactersUseCase
        mainFilters.updateValue("\(currentPage)", forKey: Constants.QueryParams.page.rawValue)
        setCharacters()
    }

    func setCharacters() {
        Task {
            do {
                characters += try await charactersUseCase.getCharacters(with: mainFilters)
                isLoading = false
            } catch {
                isLoading = false
                print(error)
            }
        }
    }

    func setFilteredCharacters() {
        Task {
            do {
                if filteredPage == 1 {
                    filteredCharacters = try await charactersUseCase.getCharacters(with: mainFilters)
                } else {
                    filteredCharacters += try await charactersUseCase.getCharacters(with: mainFilters)
                }
            } catch {
                
            }
        }
    }

    func searchByName(_ name: String) {
        filteredPage = 1
    }

    func setFavorite(at index: Int) {
        characters[index].isFavorite.toggle()
        print(characters[index].isFavorite)
    }

    func loadNewPage() {
        if !isFiltering {
            currentPage += 1
            mainFilters[Constants.QueryParams.page.rawValue] = "\(currentPage)"
            setCharacters()
        } else {
            filteredPage += 1
            mainFilters[Constants.QueryParams.page.rawValue] = "\(filteredPage)"
            setFilteredCharacters()
        }
        isLoading = true
    }
}
