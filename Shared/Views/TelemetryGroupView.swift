//
//  TelemetryGroupView.swift
//  astro-ui (iOS)
//
//  Created by Ben Tatman on 7/18/22.
//

import SwiftUI

struct TelemetryGroupView: View {
    var telemetryGroup: TelemetryGroup
    var body: some View {
        List {
            Section {
                ForEach(telemetryGroup.telemetryData) { telemetryData in
                    
                    TelemetryRowView(telemetry: telemetryData)
                }
            } header: {

                Text(telemetryGroup.name)
            }
        }
    }
}
    
    //                TelemetryGroupView(groupName: "GPS")
    //                DataRowView(telemetry: TelemetryData(mnemonic: "Latitude", value: "3.14159", unit: "km"))
    //                DataRowView(telemetry: TelemetryData(mnemonic: "Longitude", value: "3.1459", unit: "km"))
    //                TelemGroupView(groupName: "Magnetometer")


struct TelemetryGroupView_Previews: PreviewProvider {
    static var previews: some View {
        TelemetryGroupView(telemetryGroup: telemetrySet[0])
    }
}
