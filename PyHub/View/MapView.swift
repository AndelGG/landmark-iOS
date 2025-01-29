//
//  SwiftUIView.swift
//  PyHub
//
//  Created by Дмитрий Поповский on 2025-01-27.
//

import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        Map(initialPosition: .region(region))
    }
    
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 52.44260, longitude: 30.99940),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    }
}

#Preview {
    MapView()
}
