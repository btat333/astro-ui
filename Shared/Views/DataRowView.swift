//
//  DataRow.swift
//  astro-ui (iOS)
//
//  Created by Ben Tatman on 7/17/22.
//

import SwiftUI

struct DataRowView: View {
    var telemetry: TelemetryData
    var body: some View {
        HStack {
            Text(telemetry.mnemonic)
                .bold()
                .textCase(.uppercase)
                .padding()
                
            Spacer()
            HStack {
                Text(telemetry.value)
                    .font(.body)
                    .foregroundColor(.primary)
                Text(telemetry.unit)
                    .italic()
            }
            .padding()
        }.border(.tertiary)
    }
}

struct DataRowView_Previews: PreviewProvider {
    static var previews: some View {
        DataRowView(telemetry: TelemetryData(mnemonic: "gps.x", value: "5.134", unit: "km"))
    }
}
