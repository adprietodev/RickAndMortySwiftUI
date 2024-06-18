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
        List {
            Section() {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search...", text: $searchNameTextField)
                    Image(systemName: "xmark.circle")
                        .opacity(isHiddenXmarkCircle ? 0 : 1)
                }
            }
            Section("Characters") {
                ForEach(0..<10){ _ in
                    HStack {
                        Image(systemName: "person.fill")
                        VStack(alignment: .leading) {
                            Text("Name")
                            Text("Location")
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    CharactersListBuilder().build()
}
