//
//  GasStationView.swift
//  GasStation
//
//  Created by Vivian Phung on 12/16/21.
//

import SwiftUI
import Combine

struct GasStationView: View {
    @ObservedObject var viewModel: GasRequestManager

    var body: some View {
        VStack {
            Spacer()
            GasTickerView(type: .fast,
                          text: viewModel.gas?.fastest ?? "fast")
            Spacer()
            GasTickerView(type: .average,
                          text: viewModel.gas?.mid ?? "mid")
            Spacer()
            GasTickerView(type: .slow,
                          text: viewModel.gas?.lowest ?? "slow")
            Spacer()
        }
        .onAppear {
            viewModel.fetchGas()
        }
    }
}

struct GasStationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GasStationView(viewModel: .init())
                .previewDisplayName("iPhone 12 Pro Max")
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
            
            GasStationView(viewModel: .init())
                .previewDisplayName("iPod Touch")
                .previewDevice(PreviewDevice(rawValue: "iPod Touch"))

            GasStationView(viewModel: .init())
                .previewDisplayName("iPhone 12")
                .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
            GasStationView(viewModel: .init())
                .previewDisplayName("iPhone 12")
                .previewDevice(PreviewDevice(rawValue: "iPhone 12"))

            GasStationView(viewModel: .init())
                .previewDisplayName("iPhone 8")
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))

            GasStationView(viewModel: .init())
                .previewDisplayName("iPhone 12 mini")
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 mini"))
                
        }
    }
}
