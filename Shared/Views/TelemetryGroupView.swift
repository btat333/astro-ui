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
        HStack {
            Text(groupName)
                .italic()
                .padding(.leading, 30)
                .padding(.vertical, 5)
            
            Spacer()
            
        }
        .background(.ultraThinMaterial)
        .border(.quaternary)
    }
}

struct TelemetryGroupView_Previews: PreviewProvider {
    static var previews: some View {
        TelemetryGroupView()
    }
}
