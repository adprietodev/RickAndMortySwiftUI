//
//  CharacterListView.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 18/6/24.
//

import SwiftUI

struct CharacterListView<VM: CharactersListViewModelProtocol & ObservableObject>: View  {
    @ObservedObject var viewModel: VM
    @State var searchNameTextField = ""
    @State private var isSearchBarVisible = true
    @State private var searchTimer: Timer?
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.primaryGreen)
                        TextField("Search by name...", text: $searchNameTextField)
                            .onChange(of: searchNameTextField) {
                                self.searchTimer?.invalidate()
                                let newTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
                                    // TODO: - Function search
                                    print("Escrito \(searchNameTextField)")
                                }
                                self.searchTimer = newTimer
                            }
                        Button {
                            searchNameTextField = ""
                        } label: {
                            Image(systemName: "xmark.circle")
                                .foregroundStyle(.primaryGreen)
                                .opacity(searchNameTextField.isEmpty ? 0 : 1)
                                .padding(.horizontal, 6)
                        }
                        Button {
                            // TODO: - Go to filter screen
                        } label: {
                            Image(searchNameTextField.isEmpty ? "filterBlank" : "filterFill")
                                .foregroundStyle(.primaryGreen)
                        }
                    }
                    
                    if viewModel.isFiltering {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(viewModel.mainFilters.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                                    // TODO: - Filters
                                }
                            }
                        }
                    }
                }
                
                ForEach(searchNameTextField.isEmpty ? Array(viewModel.characters.enumerated()) : Array(viewModel.filteredCharacters.enumerated()), id: \.element.id) { index,character in
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
                            print(character.isFavorite)
                        } label: {
                            Image(systemName: character.isFavorite ? "heart.fill" : "heart")
                                .font(.title)
                                .foregroundColor(character.isFavorite ? .red : .gray)
                        }
                        .frame(width: 50)
                    }
                    .onAppear {
                        if character.id == viewModel.characters.last?.id && !viewModel.isLoading {
                            viewModel.loadNewPage()
                        }
                    }
                }
                
            }
            .listRowSpacing(16)
            .scrollIndicators(.hidden)
            .navigationTitle("Characters")
            .onAppear {
                UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.primaryGreen]
            }
            if viewModel.isLoading {
                ProgressView()
                
            }
        }
    }
}

#Preview {
    TabBarView()
}
