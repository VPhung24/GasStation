//
//  GasModel.swift
//  GasStation
//
//  Created by Vivian Phung on 12/16/21.
//

import Foundation

struct GasModel: Codable {
    var fast: Double
    var low: Double
    var standard: Double

    var lowest: String {
        return "\(getCleanedInt(value: low))"
    }
    
    var mid: String {
        return "\(getCleanedInt(value: standard))"
    }
    
    var fastest: String {
        return "\(getCleanedInt(value: fast))"
    }
    
    enum CodingKeys: String, CodingKey {
        case fast = "fastest"
        case low = "safeLow"
        case standard = "average"
    }
}

func getCleanedInt(value: Double) -> Int {
    return Int((value / 10).rounded(.toNearestOrAwayFromZero))
}
