//
//  TelemetryGroup.swift
//  astro-ui (iOS)
//
//  Created by Ben Tatman on 7/18/22.
//

import Foundation

struct TelemetryGroup: Decodable, Identifiable {
    var id: Int
    var name: String
    var telemetryData: [TelemetryPoint]
}
