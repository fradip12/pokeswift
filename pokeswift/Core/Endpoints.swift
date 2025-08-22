//
//  Endpoints.swift
//  pokeswift
//
//  Created by fradip12 on 22/08/25.
//

import Foundation


struct Endpoints {
    struct Gets {
        static func pokemons(_ offset: Int, _ limit: Int) -> Endpoint {
            return Endpoint(path: "/pokemon", queryItems: [
                URLQueryItem(name: "offset", value: "\(offset)"),
                URLQueryItem(name: "limit", value: "\(limit)")
            ])
        }
    }
}

struct Endpoint {
    private let baseURL = "https://pokeapi.co/api/v2"
    let path: String
    let queryItems: [URLQueryItem]?
    
    var url: String {
        var components = URLComponents(string: baseURL)
        components?.path += path
        components?.queryItems = queryItems
        return components?.url?.absoluteString ?? ""
    }
}
