//
//  FiltersProtocols.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 24/6/24.
//

import Foundation

protocol FiltersViewModelProtocol: ObservableObject {
    var mainFilters: [String: Any] { get set }
    var selectedGender: Constants.Gender { get set }
    var selectedStatus: Constants.Status { get set }
    var speciesTextField: String { get set }
    var typeTextField: String { get set }
}
