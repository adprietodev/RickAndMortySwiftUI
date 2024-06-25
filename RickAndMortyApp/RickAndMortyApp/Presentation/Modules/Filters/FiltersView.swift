//
//  FiltersView.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 24/6/24.
//

import SwiftUI

struct FiltersView<VM: FiltersViewModelProtocol>: View {
    // MARK: - Properties
    var viewModel: VM
    var delegate: CharactersViewDelegate?
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Button {
            saveFilters()
            presentationMode.wrappedValue.dismiss()
        } label: {
            Text("Save filters")
        }
    }

    func saveFilters() {
        delegate?.setMainFilters(mainFilters: viewModel.mainFilters)
    }
    
}

#Preview {
    FiltersView(viewModel: FiltersViewModel())
}
