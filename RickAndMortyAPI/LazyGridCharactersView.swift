//
//  LazyGridCharactersView.swift
//  RickAndMortyAPI
//
//  Created by Fabiola Correa Padilla.
//

import SwiftUI

struct LazyGridCharactersView: View {
    @StateObject var viewModel: RickAndMortyViewModel
    
    let columns = [GridItem(.flexible()),GridItem(.flexible())]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns, spacing: 20){
                ForEach(viewModel.filteredRickAndMortysCharacters){ rickAndMortyCharacter in
                    VStack{
                        AsyncImage(url: URL(string: rickAndMortyCharacter.image)){phase in
                            if let image = phase.image{
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                            } else if phase.error != nil {
                                        Text("Error loading image")
                                            .foregroundStyle(.red)
                            } else {
                                ProgressView()
                            }
                        }
                        Text(rickAndMortyCharacter.name.capitalized)
                            .font(.headline)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                }
            }
            .padding()
        }
    }
}

struct LazyGridCharacters_Previews: PreviewProvider {
    static var previews: some View {
        let sampleCharacters = [
            RickAndMortyModel(
                id: 1,
                name: "Rick Sanchez",
                status: "Alive",
                species: "Human",
                type: "",
                gender: "Male",
                origin: Origin(name: "Earth", url: ""),
                location: Location(name: "Earth", url: ""),
                image:"https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                episode: []
            ),
            RickAndMortyModel(
                id: 2,
                name: "Morty Smith",
                status: "Alive",
                species: "Human",
                type: "",
                gender: "Male",
                origin: Origin(name: "Earth", url: ""),
                location: Location(name: "Earth", url: ""),
                image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
                episode: []
            )
        ]
        
        let viewModel = RickAndMortyViewModel()
        viewModel.rickAndMortysCharacters = sampleCharacters
        viewModel.filteredRickAndMortysCharacters = sampleCharacters
        
        return LazyGridCharactersView(viewModel: viewModel)
    }
}


