//
//  RickAndMortyViewModel.swift
//  RickAndMortyAPI
//
//  Created by Fabiola Correa Padilla.
//

import Foundation

class RickAndMortyViewModel: ObservableObject {
    @Published var rickAndMortysCharacters: [RickAndMortyModel] = []
    @Published var filteredRickAndMortysCharacters: [RickAndMortyModel] = []
    
    init(){
        fetchRickAndMortysCharacters()
    }

    func fetchRickAndMortysCharacters(){
        Networking.shared.fetchRickAndMortysCharacters{[weak self] result in
            DispatchQueue.main.async {
                switch result{
                case .success(let rickAndMortysCharacters):
                    self?.rickAndMortysCharacters = rickAndMortysCharacters
                    self?.filteredRickAndMortysCharacters = rickAndMortysCharacters
                case .failure(let error):
                    print("Error fetching Rick and Morty characters: \(error)")
                }
            }
        }
    }
    
    func filterByName(by name: String){
        if name .isEmpty{
            filteredRickAndMortysCharacters = rickAndMortysCharacters
        }else {
            filteredRickAndMortysCharacters = rickAndMortysCharacters.filter{$0.name.lowercased().contains(name.lowercased())
            }
        }
    }
}
