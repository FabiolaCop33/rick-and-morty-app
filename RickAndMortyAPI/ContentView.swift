//
//  ContentView.swift
//  RickAndMortyAPI
//
//  Created by Fabiola Correa Padilla.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = RickAndMortyViewModel()

    var body: some View {
        NavigationView {
            if viewModel.filteredRickAndMortysCharacters.isEmpty {
                ProgressView("Loading Characters...")
            } else {
                LazyGridCharactersView(viewModel: viewModel)
                    .navigationTitle("Rick and Morty Characters")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
