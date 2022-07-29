//
//  ContentView.swift
//  Shared
//
//  Created by Ben Tatman on 7/17/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var modelData: ModelData
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        NavigationView {
            List {
                ForEach (modelData.telemetrySet) { telemetryGroup in
                    Section {
                        ForEach(telemetryGroup.telemetryData) { telemetryPoint in
                            TelemetryRowView(telemetry: telemetryPoint)
                        }
                    } header: {
                        Text(telemetryGroup.name)
                    }
                }
                
                Section {
                    HStack {
                        Text("Connection Alive")
                            
                        Spacer()
                        HStack {
                            Text(String(modelData.serverAlive))
                        }.foregroundColor(.secondary)
                    }
                } header: {
                    Text("pi")
                }
            }
            .navigationTitle("Telemetry")
        }
        .onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .active:
                print("Initializing telemetry client.")
                modelData.startTelemetryFeed()
                print("Initialized")

            case .inactive:
                print("Pausing client.")
                modelData.suspendTelemetryFeed()
                
            case .background:
                print("App is in background")
                modelData.cancelTelemetryFeed()
                
            @unknown default:
                print("Oh - interesting: I received an unexpected new value.")
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
