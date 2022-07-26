//
//  astro_uiApp.swift
//  Shared
//
//  Created by Ben Tatman on 7/17/22.
//

import SwiftUI

extension Data {
    func hexEncodedString() -> String {
        return map { String(format: "%02hhx", $0) }.joined()
    }

    func asString() -> String {
        return String(bytes: self, encoding: .utf8)!
    }
}

func readMessage(task: URLSessionWebSocketTask) {
    
    print("Finding messages")
    task.receive{ result in
        
        switch result {
        case .failure(let error):
            print(error)
        case .success(let message):
            switch message {
            case .data(let data):
                print(data)
            case .string(let string):
                print(string)
                
            @unknown default:
                print("Recieved unknown data type from web socket.")
            }
            
            readMessage(task: task)
        }
    }
}

@main
struct astro_uiApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    private let endpoint: URL = URL(string: "ws://192.168.86.250:5559")!
    private var task: URLSessionWebSocketTask

    init() {
        task = URLSession.shared.webSocketTask(with: endpoint)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .active:
                print("Initializing telemetry client.")
                task.resume()
                readMessage(task: task)
                print("Initialized")

            case .inactive:
                print("Pausing client.")
                task.suspend()
                
            case .background:
                print("App is in background")
                
            @unknown default:
                print("Oh - interesting: I received an unexpected new value.")
            }
        }
    }
}




