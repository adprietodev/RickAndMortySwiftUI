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
    weak var delegate: CharacterFavouriteDelegate?
    @Environment(\.presentationMode) var presentationMode

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
                        .font(Font(UIFont.bangers(size: 32) ?? UIFont.systemFont(ofSize: 32)))
                        .padding(.vertical, 6)
                        .padding(.horizontal, 12)
                        .background(viewModel.character.status == .alive ? .primaryGreen : viewModel.character.status == .dead ? .deadRed : .white)
                        .foregroundColor(viewModel.character.status == .unknown ? .black : .white)
                        .cornerRadius(8)
                        .offset(y: 24)
                }
            }
            HStack {
                Text("\(viewModel.character.name)")
                    .font(Font(UIFont.robotoBold(size: 32) ?? UIFont.systemFont(ofSize: 32)))
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
        .navigationTitle("Character")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                   
                }
            }
        }
    }
}

