//
//  FiltersViewModel.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 24/6/24.
//

import Foundation

class FiltersViewModel: FiltersViewModelProtocol {
    var mainFilters: [String : Any] = [Constants.QueryParams.gender.rawValue: Constants.Gender.male.rawValue]
}
