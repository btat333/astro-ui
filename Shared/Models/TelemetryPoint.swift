//
//  TelemetryData.swift
//  astro-ui (iOS)
//
//  Created by Ben Tatman on 7/17/22.
//

import Foundation

struct TelemetryPoint: Decodable, Identifiable {
    var id: Int
    var key: String
    var mnemonic: String
    var value: String
    var unit: String
}
