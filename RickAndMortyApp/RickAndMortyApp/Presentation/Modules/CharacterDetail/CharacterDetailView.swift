//
//  CharacterDetailView.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 28/6/24.
//

import SwiftUI

struct CharacterDetailView<VM: CharacterDetailViewModelProtocol>: View {
    // MARK: - Properties
    let viewModel: VM
    @State private var isExpanded = false

    var body: some View {
        ScrollView(.vertical) {
            ZStack {
                ImageURLView(character: viewModel.character, size: 264)
                    .border(
                        viewModel.character.status == .alive ? .primaryGreen : viewModel.character.status == .dead ? .deadRed : .white, width: 3
                    )
                    .cornerRadius(6)

                VStack {
                    Spacer()
                    Text("\(viewModel.character.status.rawValue)")
                        .font(.headline)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 12)
                        .background(Color.primaryGreen)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                        .offset(y: 16)
                }
            }
            Text("\(viewModel.character.name)")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 24)
                .padding(.horizontal, 24)
            
            VStack(alignment: .leading) {
                Text("Last known location:")
                    .font(.headline)
                Text("\(viewModel.character.location.name)")
                    .font(.headline)
                    .padding(.vertical, 4)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 24)
            .padding(.top, 1)
            
            VStack(alignment: .leading) {
                Text("First seen in:")
                    .font(.headline)
                Text("\(viewModel.character.origin.name)")
                    .font(.headline)
                    .padding(.vertical, 4)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 24)
            .padding(.top, 1)
            
            VStack {
                DisclosureGroup("Temporada 1", isExpanded: $isExpanded) {
                    VStack(alignment: .leading) {
                        ForEach(viewModel.character.episodes, id: \.self) { episode in
                            Text("\(episode)")
                        }
                    }
                    .padding(.leading, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .padding(.bottom, 10)
            }
            .padding()
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    CharacterDetailBuilder().build(character: Character(id: 0, name: "Adrian", status: .alive, species: "Human", type: "Human", gender: .male, origin: Location(id: 0, name:  "Torrent"), location: Location(id: 1, name: "Valencia"), image: "https://rickandmortyapi.com/api/character/avatar/156.jpeg", episodes: [1,2,3], created: "2017-12-29T15:44:40.083Z"))
}
