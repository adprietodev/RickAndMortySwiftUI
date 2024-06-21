//
//  CharacterView.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 21/6/24.
//

import SwiftUI

struct CharacterView: View {
    @ObservedObject var character: Character

    var body: some View {
        HStack{
            ImageURLView(imageURLString: character.image)
            VStack(alignment: .leading) {
                Text("\(character.name)")
                    .font(.title2)
                HStack{
                    Text("\(character.status.rawValue)")
                        .foregroundStyle(
                            character.status == .alive ? .primaryGreen : character.status == .dead ? .deadRed : .white
                        )
                    Text("\(character.species)")
                }
                Text("\(character.gender.rawValue)")
            }
            Spacer()
            Button {
                character.isFavorite.toggle()
            } label: {
                Image(systemName: character.isFavorite ? "heart.fill" : "heart")
                    .font(.title)
                    .foregroundColor(character.isFavorite ? .red : .gray)
            }
            .frame(width: 50)
        }
    }
}
