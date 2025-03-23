//
//  DestinationLocationsMapView.swift
//  ViajesDemo
//
//  Created by Juan Carlos Pazos on 21/03/25.
//

/*
 Moverse: Click y drag
 Acercarse / Acercarse: Doble clic y drag
o shift clic y drag
 Doble clin en la ubicación
 Presionar Option y drag
 Option + Shift y drag
 */

import SwiftUI
import MapKit

struct DestinationLocationsMapView: View {
    // 2 Posición
    @State private var cameraPosition: MapCameraPosition = .automatic
    // 14
    @State private var visibleRegion: MKCoordinateRegion?
    
    var body: some View {
//        Map() // 1
        Map(position: $cameraPosition) {
            // 4
//            Marker(
//                "Angel de la Independendencia",
//                coordinate: CLLocationCoordinate2D(
//                    latitude: 19.427015,
//                    longitude: -99.167643
//                )
//            )
            // 5 después de añadir la extensión
            Marker("Zoológico de Chapultepec", coordinate: .zoologico)
            // 6
            Marker(coordinate: .monumentorevolucion) {
                Label("Monumento a la Revolución", systemImage: "star.fill")
            }
            .tint(.cyan)
            // 7
            Marker("Angel de la Independencia", image: "angel", coordinate: .independencia)
                .tint(.yellow)
            // 8
            Marker("Palacio Bellas Artes", monogram: Text("BA"), coordinate: .bellasartes)
            // 9
            Marker("Plaza de la Constitución", systemImage: "person.crop.artframe", coordinate: .plazaconstitucion)
                .tint(.appBlue)
            // 10
            Annotation("Museo Antropología", coordinate: .antropologia) {
                Image(systemName: "star")
                    .imageScale(.large)
                    .foregroundStyle(.red)
                    .padding(10)
                    .background(.white)
                    .clipShape(.circle)
            }
            // 11
            Annotation("Estela de la Luz", coordinate: .estelaluz, anchor: .center) {
                Image(.estela)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
            // 12
            Annotation("Chapultepec", coordinate: .chapultepec) {
                Image(systemName: "mappin")
                    .imageScale(.large)
                    .foregroundStyle(.red)
                    .padding(5)
                    .overlay {
                        Circle()
                            .strokeBorder(.red, lineWidth: 2)
                    }
            }
            // 13
            MapCircle(
                center: CLLocationCoordinate2D(latitude: 19.430105, longitude: -99.133607),
                radius: 7000
            )
            .foregroundStyle(.red.opacity(0.5))
        } // esto es 3
        // 15
        .onMapCameraChange(frequency: .onEnd) { context in
            visibleRegion = context.region
        }
        .onAppear {
            // sigue el 2 19.430105, -99.133607
            let cdmx = CLLocationCoordinate2D(latitude: 19.430105, longitude: -99.133607)
            let cdmxSpan = MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)
            let cdmxRegion = MKCoordinateRegion(center: cdmx, span: cdmxSpan)
            self.cameraPosition = .region(cdmxRegion)
        }
    }
}

#Preview {
    DestinationLocationsMapView()
}
