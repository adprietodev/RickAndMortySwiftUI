//
//  CharactersListBuilder.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 18/6/24.
//

import Foundation

class CharactersListBuilder {
    func build() -> CharacterListView<CharactersListViewModel> {
        let viewModel = CharactersListViewModel()
        let view = CharacterListView(viewModel: viewModel)
        return view
    }
}
