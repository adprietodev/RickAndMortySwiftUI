//
//  FiltersBuilder.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 24/6/24.
//

import Foundation

class FiltersBuilder {
    func build(characterView: CharactersViewDelegate) -> FiltersView<FiltersViewModel> {
        let viewModel = FiltersViewModel()
        var view = FiltersView(viewModel: viewModel)
        view.delegate = characterView
        return view
    }
}
