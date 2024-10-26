//
//  Networking.swift
//  RickAndMortyAPI
//
//  Created by Fabiola Correa Padilla.
//

import Foundation

struct Networking{
    static let shared = Networking()
    init(){}
    
    enum ClientErrorRickAndMorty: Error{
        case invalidUrl
        case unableToComplete
        case invalidResponse
        case invalidData
        case decoding(Error)
    }
}

struct RickAndMortyResponse: Decodable {
    let results: [RickAndMortyModel]
}

extension Networking{func fetchRickAndMortysCharacters(completion: @escaping (Result<[RickAndMortyModel], ClientErrorRickAndMorty>) -> Void) {
    let url = Constants.Urls.rickAndMortysCharacters
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        
        if let error = error {
            completion(.failure(.unableToComplete))
            return
        }
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            completion(.failure(.invalidResponse))
            return
        }
        
        guard let data = data else {
            completion(.failure(.invalidData))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let responseData = try decoder.decode(RickAndMortyResponse.self, from: data)
            completion(.success(responseData.results))
        } catch {
            completion(.failure(.decoding(error)))
        }
    }
    task.resume()
    }
}
