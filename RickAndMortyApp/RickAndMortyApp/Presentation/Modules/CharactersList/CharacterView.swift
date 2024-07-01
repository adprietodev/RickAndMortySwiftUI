//
//  CharacterView.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 21/6/24.
//

import SwiftUI

struct CharacterView<VM: CharactersListViewModel>: View {
    @Binding var character: Character
    weak var delegate: CharacterFavouriteDelegate?

    var body: some View {
        HStack{
            ImageURLView(character: character, size: 64)
                .border(
                    character.status == .alive ? .primaryGreen : character.status == .dead ? .deadRed : .white, width: 3
                )
                .cornerRadius(6)
            VStack(alignment: .leading) {
                Text("\(character.name)")
                    .font(Font(UIFont.robotoMedium(size: 24) ?? UIFont.systemFont(ofSize: 24)))
                HStack {
                    Text("\(character.species)")
                        .font(Font(UIFont.robotoRegular(size: 18) ?? UIFont.systemFont(ofSize: 12)))
                    Text("\(character.gender.rawValue)")
                        .font(Font(UIFont.robotoRegular(size: 18) ?? UIFont.systemFont(ofSize: 12)))
                }
                HStack {
                    Text("\(character.status.rawValue)")
                        .foregroundStyle(
                            character.status == .alive ? .primaryGreen : character.status == .dead ? .deadRed : .white
                        )
                        .font(Font(UIFont.robotoRegular(size: 18) ?? UIFont.systemFont(ofSize: 12)))
                }
            }
            Spacer()
            Button {
                delegate?.updateFavourite(character: character)
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
