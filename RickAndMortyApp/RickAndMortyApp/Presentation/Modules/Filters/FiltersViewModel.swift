//
//  FiltersViewModel.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 24/6/24.
//

import SwiftUI

class FiltersViewModel: FiltersViewModelProtocol,ObservableObject {
    @Published var mainFilters: [String : Any] = [Constants.QueryParams.gender.rawValue: Constants.Gender.male.rawValue]
    @Published var selectedGender: Constants.Gender = .none
    @Published var selectedStatus: Constants.Status  = .none
    @Published var speciesTextField: String = ""
    @Published var typeTextField: String = ""
}
