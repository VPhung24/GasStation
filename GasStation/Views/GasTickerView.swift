//
//  GasTickerView.swift
//  GasStation
//
//  Created by Vivian Phung on 12/16/21.
//

import SwiftUI

enum GasTickerType {
    case fast
    case average
    case slow
}

struct GasTickerView: View {
    let type: GasTickerType
    let text: String
    
    var body: some View {
        VStack {
            Text(text)
                .font(.system(size: 80, weight: .bold, design: .monospaced))
            Text("gwei")
                .font(.system(size: 30, weight: .semibold, design: .monospaced))
        }
        .frame(width: deviceManger.size.width / 1.5, height: deviceManger.size.height / 4)
        .background(tickerTypeToColor(type: type))
        .foregroundColor(.white)
        .cornerRadius(21)
    }
    
    func tickerTypeToColor(type: GasTickerType) -> Color {
        switch type {
        case .fast:
            return .green
        case .average:
            return .yellow
        case .slow:
            return .red
        }
    }
}

struct GasTickerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GasTickerView(type: .fast, text: gas.fastest)
                .previewLayout(.sizeThatFits)
                .padding()
                .previewDisplayName("fast")
            
            GasTickerView(type: .average, text: gas.mid)
                .previewLayout(.sizeThatFits)
                .padding()
                .previewDisplayName("average")
            
            GasTickerView(type: .slow, text: gas.lowest)
                .previewLayout(.sizeThatFits)
                .padding()
                .previewDisplayName("slow")
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .dark)
            
        }
    }
}
