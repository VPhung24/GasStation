//
//  GasRequestManager.swift
//  GasStation
//
//  Created by Vivian Phung on 12/16/21.
//

import Foundation
import Combine
import SwiftUI

enum QueryError: Error {
    case obvious
}

final class GasRequestManager: ObservableObject {
    private var networkManager = NetworkManager()
    private var cancellable: AnyCancellable?
    var urlSession = URLSession.shared

    @Published var gas: GasModel?

    func fetchGas() {
        cancellable = urlSession
            .publisher(for: networkManager.url!, decoder: networkManager.jsonDecoder)
            .retry(3)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    // add error handling
                    print(error.localizedDescription)
                }
                self.fetchGas()
            }, receiveValue: { [weak self] (model: GasModel) in
                guard let self = self else { return }
                self.gas = model
                self.fetchGas()
            })
    }
}
