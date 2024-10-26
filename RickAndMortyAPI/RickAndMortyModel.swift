//
//  RichAndMortyModel.swift
//  RickAndMortyAPI
//
//  Created by Fabiola Correa Padilla.
//

import Foundation
struct RickAndMortyModel: Decodable,Identifiable,Hashable{
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin?
    let location: Location?
    let image: String
    let episode: [String]
}
struct Origin: Decodable,Hashable{
    let name: String
    let url: String
}
struct Location: Decodable,Hashable{
    let name: String
    let url: String
}


