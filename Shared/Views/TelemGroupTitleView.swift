//
//  TelemGroupView.swift
//  astro-ui (iOS)
//
//  Created by Ben Tatman on 7/17/22.
//

import SwiftUI

struct TelemGroupTitleView: View {
    var groupName: String
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

struct TelemGroupView_Previews: PreviewProvider {
    static var previews: some View {
        TelemGroupView(groupName: "GPS")
    }
}
