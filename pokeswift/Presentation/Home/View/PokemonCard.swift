//
//  PokemonCard.swift
//  pokeswift
//
//  Created by fradip12 on 22/08/25.
//

import SwiftUICore
import SwiftUI

struct PokemonCard: View {
    let pokemonEntry: PokemonEntryModel
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: pokemonEntry.imageUrl)) { image in
                image.resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
            } placeholder: {
                Rectangle().fill(.ultraThinMaterial)
                    .frame(width: 120, height: 120)
            }

            Text(pokemonEntry.name.capitalized)
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                .foregroundColor(.black)
                .padding(.top, 4)
        }
        .padding(16)
        .background(.white)
        .cornerRadius(8)
        .shadow(color: Color("shadowColor"), radius: 24, x: 0, y: 16)
        
    }
}
