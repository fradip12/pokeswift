//
//  RemoteDatasource.swift
//  pokeswift
//
//  Created by fradip12 on 22/08/25.
//

import Foundation

protocol RemoteDatasourceProtocol {
    func getPokemons(offset: Int, limit: Int) async throws -> PokemonResponse
}


struct RemoteDatasource {
    private init() {}
    
    static let shared: RemoteDatasource = RemoteDatasource()
}

extension RemoteDatasource: RemoteDatasourceProtocol{
    func getPokemons(offset: Int, limit: Int) async throws -> PokemonResponse {
        guard let url = URL(string: Endpoints.Gets.pokemons(offset,limit).url) else {throw URLError(.badURL)}
        
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        do {
            return try JSONDecoder().decode(PokemonResponse.self, from: data)
        } catch {
            throw URLError(.cannotParseResponse)
        }
            
    }
}

