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


@main
struct astro_uiApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}




