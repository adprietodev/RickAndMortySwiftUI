//
//  CharacterDetailViewModel.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 28/6/24.
//

import Foundation

class CharacterDetailViewModel: CharacterDetailViewModelProtocol {
    var character: Character

    init(character: Character) {
        self.character = character
    }
}
