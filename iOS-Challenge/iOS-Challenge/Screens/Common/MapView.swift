//
//  MapView.swift
//  iOS-Challenge
//
//  Created by josepL on 30/3/25.
//

import MapKit
import SwiftUI

/// Optional Bonus: Show the location of the ad using a map view, indicating its position.
struct MapView: View {
    @State private var region: MKCoordinateRegion

    let latitude: Double
    let longitude: Double

    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        _region = State(initialValue: MKCoordinateRegion(
            center: coordinate,
            latitudinalMeters: 500,
            longitudinalMeters: 500))
    }

    var body: some View {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        return Map(coordinateRegion: $region, annotationItems: [AnnotationItem(coordinate: coordinate)]) { item in
            MapMarker(coordinate: item.coordinate, tint: .red)
        }
        .cornerRadius(DesignSystem.CornerRadius.m)
    }
}

struct AnnotationItem: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

#Preview {
    MapView(latitude: 40.4362687, longitude: -3.6833686)
}
