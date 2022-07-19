//
//  DataRow.swift
//  astro-ui (iOS)
//
//  Created by Ben Tatman on 7/17/22.
//

import SwiftUI

struct TelemetryRowView: View {
    var telemetry: TelemetryPoint
    var body: some View {
        HStack {
            Text(telemetry.mnemonic)
                
            Spacer()
            HStack {
                Text(telemetry.value)
                Text(telemetry.unit)
                    .italic()
            }.foregroundColor(.secondary)
        }
    }
}

struct DataRowView_Previews: PreviewProvider {
    static var previews: some View {
        TelemetryRowView(telemetry: telemetrySet[0].telemetryData[0])
    }
}
