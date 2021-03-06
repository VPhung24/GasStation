//
//  NetworkManager.swift
//  GasStation
//
//  Created by Vivian Phung on 12/16/21.
//

import Foundation
import Combine

// Example Query: https://data-api.defipulse.com/api/v1/egs/api/ethgasAPI.json?api-key=<INSERT_API_KEY_HERE>

struct NetworkManager {
    let url: URL!
    let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.assumesTopLevelDictionary = true
        return jsonDecoder
    }()
    
    init() {
        // testing urself? hardcode apikey here & comment guard below
        // let key = ...
        
        guard let key = Bundle.main.infoDictionary?["API_KEY"] as? String else {
            // add error handling
            fatalError("api key not found")
        }
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "data-api.defipulse.com"
        components.path = "/api/v1/egs/api/ethgasAPI.json"
        components.queryItems = [
            URLQueryItem(name: "api-key", value: key)
        ]
        url = components.url
    }
}

extension URLSession {
    func publisher<T: Decodable>(
        for url: URL,
        decoder: JSONDecoder = JSONDecoder()
    ) -> AnyPublisher<T, Error> {
        dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
