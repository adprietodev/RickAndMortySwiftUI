//
//  CharacterDetailView.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 28/6/24.
//

import SwiftUI

struct CharacterDetailView<VM: CharacterDetailViewModel>: View {
    // MARK: - Properties
    @StateObject var viewModel: VM
    @State private var isExpanded = false
    var delegate: CharacterFavouriteDelegate?

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
                        .background(viewModel.character.status == .alive ? .primaryGreen : viewModel.character.status == .dead ? .deadRed : .white)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                        .offset(y: 16)
                }
            }
            HStack {
                Text("\(viewModel.character.name)")
                    .font(.title)
                Spacer()
                Button {
                    viewModel.character.isFavorite.toggle()
                    viewModel.updateFavourite()
                    delegate?.updateFavourite(character: viewModel.character)
                } label: {
                    Image(systemName: viewModel.character.isFavorite ? "heart.fill" : "heart")
                        .font(.title)
                        .foregroundColor(viewModel.character.isFavorite ? .red : .gray)
                }
                .frame(width: 64)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 24)
            .padding(.horizontal, 24)

            VStack(alignment: .leading) {
                Text("Last known location:")
                    .font(.headline)
                    .foregroundStyle(Color.gray.opacity(0.5))
                Text("\(viewModel.character.location.name)")
                    .font(.headline)
                Spacer()
                Text("First seen in:")
                    .font(.headline)
                    .foregroundStyle(Color.gray.opacity(0.5))
                Text("\(viewModel.character.origin.name)")
                    .font(.headline)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 24)
            .padding(.top, 1)
            
            VStack(alignment: .leading) {
                DisclosureGroup("Episodes", isExpanded: $isExpanded) {
                    VStack(alignment: .leading) {
                        ForEach(viewModel.episodes, id: \.id) { episode in
                            HStack {
                                Image(systemName: "play.rectangle.fill")
                                Text("\(episode.episode)")
                                    .foregroundStyle(.white)
                                Spacer()
                                Text("\(episode.name)")
                                    .foregroundStyle(.white)
                            }
                            .padding(4)
                            
                            if viewModel.episodes.last?.id != episode.id {
                                Divider()
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .padding(.bottom, 10)
                .foregroundStyle(.primaryGreen)
            }
            .padding(24)
        }
        .preferredColorScheme(.dark)
    }
}


#Preview {
    var characterMock = Character(id: 0, name: "Adrian", status: .alive, species: "Human", type: "Human", gender: .male, origin: Location(id: 0, name:  "Torrent"), location: Location(id: 1, name: "Valencia"), image: "https://rickandmortyapi.com/api/character/avatar/156.jpeg", episodes: [1,2,3], created: "2017-12-29T15:44:40.083Z")
    
    let remoteCharactersDatasource = ApiRickAndMoryCharactersDatasource()
    let localCharactersDatasource = LocalRickAndMortyCharactersDatasource()
    let charactersRepository = CharactersRepository(remoteDatasource: remoteCharactersDatasource, localDatasource: localCharactersDatasource)
    let charactersUseCase = CharactersUseCase(repository: charactersRepository)
    return CharacterDetailBuilder().build(character: characterMock, delegate: CharactersListViewModel(charactersUseCase: charactersUseCase))
}
