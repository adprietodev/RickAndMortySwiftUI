//
//  FiltersView.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 24/6/24.
//

import SwiftUI

struct FiltersView<VM: FiltersViewModel>: View {
    // MARK: - Properties
    @StateObject var viewModel: VM
    var delegate: CharactersViewDelegate?
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack {
                        Image(systemName: "person.3.fill")
                            .frame(width: 24, height: 24)
                            .foregroundColor(.primaryGreen)
                        TextField("Insert specie..", text: $viewModel.speciesTextField)
                            .padding(.horizontal, 8)
                    }
                }
                
                Section {
                    HStack {
                        Image(systemName: "tray.full.fill")
                            .frame(width: 24, height: 24)
                            .foregroundColor(.primaryGreen)
                        TextField("Insert type..", text: $viewModel.typeTextField)
                            .padding(.horizontal, 8)
                    }
                }
                
                Section {
                    Picker("Select Gender", selection: $viewModel.selectedGender) {
                        ForEach(Constants.Gender.allCases) { gender in
                            Text(gender.rawValue).tag(gender)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }

                Section {
                    Picker("Select Status", selection: $viewModel.selectedStatus) {
                        ForEach(Constants.Status.allCases) { status in
                            Text(status.rawValue).tag(status)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
            }
            .navigationTitle("Filters")
            .padding(.vertical, 16)
            .scrollDisabled(true)
            
            Spacer()
            
            Button{
                saveFilters()
            } label: {
                Text(viewModel.countCharacterFilter == 0 ? "SEARCH" : "SEARCH \(viewModel.countCharacterFilter) CHARACTERS")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.primaryGreen)
                    .opacity(viewModel.countCharacterFilter == 0 ? 0.5 : 1)
                    .foregroundColor(.black)
                    .cornerRadius(8)
                    .padding()
            }
            .disabled(viewModel.countCharacterFilter == 0)
        }
        .preferredColorScheme(.dark)
        .onDisappear {
            if viewModel.countCharacterFilter == 0 {
                delegate?.setMainFilters(mainFilters: viewModel.mainFilters)
            }
        }
    }

    func saveFilters() {
        delegate?.setMainFilters(mainFilters: viewModel.mainFilters)
        presentationMode.wrappedValue.dismiss()
    }
    
}

#Preview {
    TabBarView()
}
