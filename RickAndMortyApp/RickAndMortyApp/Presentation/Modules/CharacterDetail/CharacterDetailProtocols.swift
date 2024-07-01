//
//  CharacterDetailProtocols.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 28/6/24.
//

import SwiftUI
import Combine

protocol CharacterDetailViewModelProtocol: ObservableObject {
    var character: Character { get set }
    var episodes: [Episode] { get set }
    func updateFavourite()
}
