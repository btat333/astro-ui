//
//  ContentView.swift
//  Shared
//
//  Created by Ben Tatman on 7/17/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: .zero) {
                HStack {
                    Text("Telemetry")
                        .foregroundColor(.white)
                        .font(.title)
                        .padding()
                    Spacer()
                }.background(.black)
                
                UITableView()
                
                TelemGroupView(groupName: "GPS")
                DataRowView(telemetry: TelemetryData(mnemonic: "Latitude", value: "3.14159", unit: "km"))
                DataRowView(telemetry: TelemetryData(mnemonic: "Longitude", value: "3.1459", unit: "km"))
                TelemGroupView(groupName: "Magnetometer")
            }

            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
