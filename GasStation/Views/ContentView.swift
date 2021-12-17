//
//  ContentView.swift
//  GasStation
//
//  Created by Vivian Phung on 12/16/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = GasRequestManager()

    var body: some View {
        GasStationView(viewModel: viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
