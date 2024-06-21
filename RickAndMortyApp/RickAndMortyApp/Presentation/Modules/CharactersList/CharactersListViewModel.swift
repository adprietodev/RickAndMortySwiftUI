//
//  CharactersListViewModel.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 18/6/24.
//

import SwiftUI
import Combine

class CharactersListViewModel: ObservableObject, CharactersListViewModelProtocol {
    let charactersUseCase: CharactersUseCaseProtocol
    @Published var mainFilters = [String: Any]()
    @Published var characters = [Character]()
    @Published var filteredCharacters = [Character]()
    @Published var isLoading: Bool = false
    private var currentPage: Int = 1
    private var filteredPage: Int = 1
    @Published var isFiltering: Bool = false
    
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
