//
//  FiltersViewModel.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 24/6/24.
//

import SwiftUI

class FiltersViewModel: ObservableObject {
    // MARK: - Properties
    let charactersUseCase: CharactersUseCaseProtocol
    @Published var mainFilters: [String : Any]
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
    
    init(charactersUseCase: CharactersUseCaseProtocol, mainFilters: [String:Any]) {
        self.charactersUseCase = charactersUseCase
        self.mainFilters = mainFilters
        initFilters()
    }

    // MARK: - Functions
    func setFilter(with query: String, param: Any) {
        guard let paramStr = param as? String else { return }
        let filteredParamStr = paramStr == "none" ? "" : paramStr

        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            if filteredParamStr.isEmpty {
                mainFilters.removeValue(forKey: query)
            } else {
                mainFilters[query] = param
            }
        }
        
        getCountTotalCharacters()
    }

    func initFilters() {
        if mainFilters.keys.contains(Constants.QueryParams.gender.rawValue) {
            guard let genderStr = mainFilters[Constants.QueryParams.gender.rawValue] as? String else { return }
            selectedGender = Constants.Gender(rawValue: genderStr) ?? .none
        }

        if mainFilters.keys.contains(Constants.QueryParams.status.rawValue) {
            guard let statusStr = mainFilters[Constants.QueryParams.status.rawValue] as? String else { return }
            selectedStatus = Constants.Status(rawValue: statusStr) ?? .none
        }

        if mainFilters.keys.contains(Constants.QueryParams.species.rawValue) {
            guard let speciesStr = mainFilters[Constants.QueryParams.species.rawValue] as? String else { return }
            speciesTextField = speciesStr
        }

        if mainFilters.keys.contains(Constants.QueryParams.type.rawValue) {
            guard let typeStr = mainFilters[Constants.QueryParams.type.rawValue] as? String else { return }
            typeTextField = typeStr
        }
    }

    func getCountTotalCharacters() {
        Task {
            do {
                countCharacterFilter = checkSpecialFilters() ? try await charactersUseCase.getCountOfTotalCharacters(with: mainFilters) : 0
            } catch {
                
            }
        }
    }

    func checkSpecialFilters() -> Bool {
        mainFilters.containsAdditionalFilter(keys: [
            Constants.QueryParams.gender.rawValue,
            Constants.QueryParams.species.rawValue,
            Constants.QueryParams.status.rawValue,
            Constants.QueryParams.type.rawValue,
        ])
    }
}
