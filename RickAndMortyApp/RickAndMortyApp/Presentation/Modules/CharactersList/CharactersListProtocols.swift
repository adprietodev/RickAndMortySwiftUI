//
//  CharactersListProtocols.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 18/6/24.
//

import SwiftUI

protocol CharactersViewDelegate{
    func setMainFilters(mainFilters: [String:Any])
}

protocol FilterCellDellegate: AnyObject {
    func removeFilter(with key: String)
}

protocol CharacterFavouriteDelegate: AnyObject {
    func updateFavourite(character: Character)
}
