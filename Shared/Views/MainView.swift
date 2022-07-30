//
//  MainView.swift
//  astro-ui (iOS)
//
//  Created by Ben Tatman on 7/29/22.
//

import SwiftUI

struct MainView: View {
    
    enum Tab {
         case featured
         case list
     }
    
    @State private var selection: Tab = .featured
    
    var body: some View {
        TabView(selection: $selection) {
            CommandView()
                .tabItem {
                    Label("Point", systemImage: "star")
                }
                .tag(Tab.featured)

            ContentView()
                .tabItem {
                    Label("Telemetry", systemImage: "display")
                }
                .tag(Tab.list)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ModelData())
    }
}
