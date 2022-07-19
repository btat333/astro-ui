//
//  ContentView.swift
//  Shared
//
//  Created by Ben Tatman on 7/17/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach (telemetrySet) { telemetryGroup in
                    Section {
                        ForEach(telemetryGroup.telemetryData) { telemetryPoint in
                            TelemetryRowView(telemetry: telemetryPoint)
                        }
                    } header: {
                        Text(telemetryGroup.name)
                    }
                }
            }
            .navigationTitle("Telemetry")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
