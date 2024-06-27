//
//  FiltersViewModel.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 24/6/24.
//

import SwiftUI

class FiltersViewModel: FiltersViewModelProtocol,ObservableObject {
    // MARK: - Properties
    let charactersUseCase: CharactersUseCaseProtocol
    @Published var mainFilters: [String : Any] = [:]
    @Published var countCharacterFilter: Int = 0
    @Published var selectedGender: Constants.Gender = .none {
        didSet {
            setFilter(with: Constants.QueryParams.gender.rawValue, param: selectedGender.rawValue)
        }
    }
    @Published var selectedStatus: Constants.Status  = .none {
        didSet {
            setFilter(with: Constants.QueryParams.status.rawValue, param: selectedStatus.rawValue)
        }
    }
    @Published var speciesTextField: String = "" {
        didSet {
            setFilter(with: Constants.QueryParams.species.rawValue, param: speciesTextField)
        }
    }
    @Published var typeTextField: String = "" {
        didSet {
            setFilter(with: Constants.QueryParams.type.rawValue, param: typeTextField)
        }
    }
    
    init(charactersUseCase: CharactersUseCaseProtocol) {
        self.charactersUseCase = charactersUseCase
    }

    // MARK: - Functions
    func setFilter(with query: String, param: Any) {
        guard let paramStr = param as? String else { return }
        let filteredParamStr = paramStr == "none" ? "" : paramStr
        
        if filteredParamStr.isEmpty {
            mainFilters.removeValue(forKey: query)
        } else {
            mainFilters[query] = param
        }
        getCountTotalCharacters()
    }

    func getCountTotalCharacters() {
        Task {
            do {
                countCharacterFilter = !mainFilters.isEmpty ? try await charactersUseCase.getCountOfTotalCharacters(with: mainFilters) : 0
            } catch {
                
            }
        }
    }
}
