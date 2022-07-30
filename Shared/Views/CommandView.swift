//
//  CommandView.swift
//  astro-ui (iOS)
//
//  Created by Ben Tatman on 7/29/22.
//

import SwiftUI

let raFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.maximum = 360
    formatter.minimum = 0
    return formatter
}()

let decFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.maximum = 90
    formatter.minimum = -90
    return formatter
}()

struct CommandView: View {
    
    @State private var RA: Double = 0
    @State private var Dec: Double = 0
    @State private var presentAlert = false
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        VStack {
            Form {
                Section {
                    HStack {
                        TextField("RA",value:$RA,formatter:raFormatter)
                            .keyboardType(.decimalPad)
                        Spacer()
                        Text("deg")
                            .foregroundColor(.secondary)
                    }
                    HStack {
                        TextField("Dec",value:$Dec,formatter:decFormatter)
                            .keyboardType(.decimalPad)
                        Spacer()
                        Text("deg")
                            .foregroundColor(.secondary)
                    }
                    Button(action: {
                        sendPointCommand(ra: $RA.wrappedValue, dec: $Dec.wrappedValue) { error in
                            
                            if (error == true) {
                                $presentAlert.wrappedValue = true
                            }
                        }
                    }) {
                        Text("Point")
                    }
                } header: {
                    Text("RA/Dec Point")
                }
            }
            
        }.alert(isPresented:$presentAlert) {
            Alert(
                title: Text("Failed Web Socket Connection")
            )
        }
        .onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .active:
                print("Initializing telemetry client.")
                //startCommandSocket()
                print("Initialized")

            case .inactive:
                print("Pausing client.")
                //pauseCommandSocket()
                
            case .background:
                print("App is in background")
                //cancelCommandSocket()
                
            @unknown default:
                print("Oh - interesting: I received an unexpected new value.")
            }
        }
    }
}

struct CommandView_Previews: PreviewProvider {
    static var previews: some View {
        CommandView()
    }
}
