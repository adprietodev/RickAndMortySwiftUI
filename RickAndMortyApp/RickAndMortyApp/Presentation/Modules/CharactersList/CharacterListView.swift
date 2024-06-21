//
//  CharacterListView.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 18/6/24.
//

import SwiftUI

struct CharacterListView<VM: CharactersListViewModelProtocol>: View  {
    @StateObject var viewModel: VM

    @State var searchNameTextField = ""
    @State private var isSearchBarVisible = true
    @State private var searchTimer: Timer?
    @State private var isSearching:  Bool = false
    
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
                                    viewModel.searchByName(searchNameTextField)
                                    isSearching = !searchNameTextField.isEmpty
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
                            viewModel.checkAdditionalFilters()
                        } label: {
                            Image(viewModel.hasAdditionalFilters ? "filterFill" : "filterBlank")
                                .foregroundStyle(.primaryGreen)
                        }
                    }
                    
                    if viewModel.hasAdditionalFilters {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(viewModel.mainFilters.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                                    if key != Constants.QueryParams.page.rawValue && key != Constants.QueryParams.name.rawValue {
                                        Text("\(String(describing: viewModel.mainFilters[key]!))")
                                    }
                                }
                            }
                        }
                    }
                }
                ForEach(!isSearching ? viewModel.characters : viewModel.filteredCharacters) { character in
                    
                    CharacterView(character: character)
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
