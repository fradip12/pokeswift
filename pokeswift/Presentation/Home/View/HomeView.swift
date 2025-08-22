import SwiftUI

struct HomeView: View {
    @StateObject var vm: HomeViewModel = .init(
        getPokemonUseCase: Injection.shared.provideGetPokemonUseCase()
    )
    
    var body: some View {
        VStack(alignment: .leading) {
            logo
            
            pokemonList // always present
            
        }
        .ignoresSafeArea()
        .background(
            VStack {
                Image("bg")
                    .padding(.top, -100)
                Spacer()
            }
        )
        .overlay {
            if vm.isLoading && vm.pokemons.isEmpty {
                // show full screen loader only on first load
                ZStack {
                    Color.black.opacity(0.2).ignoresSafeArea()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(1.5)
                }
            }
        }
        .task {
            if vm.pokemons.isEmpty {
                try? await vm.getPokemons()
            }
        }
    }
}

extension HomeView {
    var logo : some View {
        HStack {
            Spacer()
            Image("logo")
                .resizable()
                .scaledToFill()
                .frame(width: 130, height: 48)
            Spacer()
        }
        .padding(.top, 64)
        .padding(.horizontal, 24)
    }
    
    var title : some View {
        Text("Pokédex")
            .font(.system(size: 24, weight: .semibold, design: .rounded))
            .foregroundColor(.black)
            .padding(.horizontal, 24)
    }
    
    var pokemonList : some View {
        ScrollView {
            HStack {
                title
                Spacer()
            }
            
            LazyVGrid(
                columns: [
                    GridItem(.adaptive(minimum: 150)),
                    GridItem(.adaptive(minimum: 150))
                ],
                spacing: 16
            ) {
                ForEach(vm.pokemons, id: \.id) { pokemon in
                    PokemonCard(pokemonEntry: pokemon)
                        .onAppear {
                            if let last = vm.pokemons.last,
                               pokemon.id == last.id {
                                Task { try? await vm.getPokemons() }
                            }
                        }
                }
                
                if vm.isLoading && !vm.pokemons.isEmpty {
                    // show bottom loader for pagination
                    ProgressView()
                        .frame(maxWidth: .infinity)
                        .padding()
                }
            }
            .padding(.horizontal, 16)
        }
        .scrollIndicators(.hidden)
    }
}
