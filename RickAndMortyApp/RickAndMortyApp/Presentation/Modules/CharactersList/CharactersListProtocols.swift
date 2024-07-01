//
//  CharactersListProtocols.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 18/6/24.
//

import SwiftUI

protocol CharactersViewDelegate {
    func setMainFilters(mainFilters: [String:Any])
}

protocol FilterCellDellegate {
    func removeFilter(with key: String)
}

protocol CharacterFavouriteDelegate {
    func updateFavourite(character: Character)
}
