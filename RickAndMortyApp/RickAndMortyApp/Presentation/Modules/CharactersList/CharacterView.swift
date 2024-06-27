//
//  CharacterView.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 21/6/24.
//

import SwiftUI

struct CharacterView<VM: CharactersListViewModelProtocol>: View {
    @ObservedObject var character: Character
    var viewModel: VM

    var body: some View {
        HStack{
            ImageURLView(character: character)
                .border(
                    character.status == .alive ? .primaryGreen : character.status == .dead ? .deadRed : .white, width: 3
                )
                .cornerRadius(6)
            VStack(alignment: .leading) {
                Text("\(character.name)")
                    .font(.title3)
                HStack {
                    Text("\(character.species)")
                    Text("\(character.gender.rawValue)")
                }
                HStack {
                    Text("\(character.status.rawValue)")
                        .foregroundStyle(
                            character.status == .alive ? .primaryGreen : character.status == .dead ? .deadRed : .white
                        )
                }
            }
            Spacer()
            Button {
                character.isFavorite.toggle()
                viewModel.updateFavourite(character: character)
            } label: {
                Image(systemName: character.isFavorite ? "heart.fill" : "heart")
                    .font(.title)
                    .foregroundColor(character.isFavorite ? .red : .gray)
            }
            .buttonStyle(PlainButtonStyle())
            .frame(width: 50)
        }
        .id(character.id)
    }
}

#Preview {
    TabBarView()
}
