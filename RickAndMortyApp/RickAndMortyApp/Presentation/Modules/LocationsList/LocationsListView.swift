//
//  LocationListView.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 1/7/24.
//

import SwiftUI

struct LocationsListView<VM: LocationsListViewModel>: View {
    @StateObject var viewModel: VM
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.locations, id: \.id) { location in
                    HStack {
                        Text(location.name)
                        Text(location.type)
                    }
                    .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
                }
            }
            .listRowSpacing(16)
            .scrollIndicators(.hidden)
            
            .navigationTitle("Locations")
        }
    }
}

#Preview {
    TabBarView()
}
