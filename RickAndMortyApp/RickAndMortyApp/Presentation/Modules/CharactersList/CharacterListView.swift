//
//  CharacterListView.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 18/6/24.
//

import SwiftUI

struct CharacterListView<VM>: View where VM: CharactersListViewModelProtocol {
    @State var viewModel: VM
    @State var searchNameTextField = ""
    @State var isHiddenXmarkCircle = true
    
    var body: some View {
        NavigationStack {
            List {
                Section() {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Search...", text: $searchNameTextField)
                        Image(systemName: "xmark.circle")
                            .opacity(isHiddenXmarkCircle ? 0 : 1)
                    }
                }
                
                ForEach(viewModel.characters){ character in
                    HStack {
                        ImageURLView(imageURLString: character.image)
                        VStack(alignment: .leading) {
                            Text("\(character.name)")
                            Text("\(character.status.rawValue)")
                        }
                        .padding(.leading, 12)
                    }
                }
            }
            .listRowSpacing(16)
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    CharactersListBuilder().build()
}
