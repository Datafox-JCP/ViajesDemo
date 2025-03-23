//
//  StartTab.swift
//  ViajesDemo
//
//  Created by Juan Carlos Pazos on 21/03/25.
//

import SwiftUI

struct StartTab: View {
    var body: some View {
        TabView {
            Tab("Map", systemImage: "map") {
                MapTripView()
                    .toolbarBackground(.appBlue.opacity(0.8), for: .tabBar)
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
                    .toolbarColorScheme(.dark, for: .tabBar)
            } // Map tab
            
            Tab("Destinations", systemImage: "globe.desk") {
                DestinationLocationsMapView()
                    .toolbarBackground(.appBlue.opacity(0.8), for: .tabBar)
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
                    .toolbarColorScheme(.dark, for: .tabBar)
            } // Destinations tab
        } // Tab
    }
}

#Preview {
    StartTab()
}
