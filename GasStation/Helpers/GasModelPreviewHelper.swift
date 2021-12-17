//
//  GasModelPreviewHelper.swift
//  GasStation
//
//  Created by Vivian Phung on 12/16/21.
//

import Foundation

var gas: GasModel = load("ExampleGasQuery.json")

func load<T: Decodable>(_ filename: String) -> T {
    let networking = NetworkManager()
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        return try networking.jsonDecoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
