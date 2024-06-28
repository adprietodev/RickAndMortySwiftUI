//
//  CharacterDetailBuilder.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 28/6/24.
//

import Foundation

class CharacterDetailBuilder {
    func build(character: Character) -> CharacterDetailView<CharacterDetailViewModel> {
        let viewModel = CharacterDetailViewModel(character: character)
        let view = CharacterDetailView(viewModel: viewModel)
        return view
    }
}
