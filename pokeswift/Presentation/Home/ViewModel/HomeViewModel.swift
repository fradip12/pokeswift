//
//  HomeViewModel.swift
//  pokeswift
//
//  Created by fradip12 on 22/08/25.
//

import Foundation

@MainActor class HomeViewModel : ObservableObject {
    let getPokemonsUseCase: GetPokemonsUseCase
    
    @Published var pokemons: [PokemonEntryModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var offset: Int = 0
    let limit: Int = 10
    
    init(getPokemonUseCase: GetPokemonsUseCase){
        self.getPokemonsUseCase = getPokemonUseCase
    }
    
    func getPokemons() async throws {
        // Avoid double calls
        guard !isLoading else { return }
        
        // loading state
        isLoading = true
        
        // Call Usecase
        let result = try await getPokemonsUseCase.execute(offset: offset, limit: limit)
        
        print(result)
        
        switch result {
        case .success(let pokemons):
            self.pokemons.append(contentsOf: pokemons)
            self.offset += limit
            self.isLoading = false
        case .failure(let failure):
            self.isLoading = false
            self.errorMessage = failure.localizedDescription
        }
    }
}
