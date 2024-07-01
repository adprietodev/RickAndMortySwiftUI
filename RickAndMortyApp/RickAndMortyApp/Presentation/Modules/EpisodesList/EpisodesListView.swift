//
//  EpisodesListView.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 1/7/24.
//

import SwiftUI

struct EpisodesListView<VM: EpisodesListViewModel>: View {
    @StateObject var viewModel: VM
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.episodes, id: \.id) { episode in
                    HStack {
                        Text(episode.episode)
                        Text(episode.name)
                    }
                    .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
                }
            }
            .listRowSpacing(16)
            .scrollIndicators(.hidden)
            .navigationTitle("Episodes")
        }
    }
}

#Preview {
    TabBarView()
}
