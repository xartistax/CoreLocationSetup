//
//  ContentView.swift
//  CoreLocationSetup
//
//  Created by Demian Füglistaler on 17.12.2023.
//

import SwiftUI
import MapKit

// SwiftUI view that displays a map.
struct MapView: View {
    
    // StateObject to observe changes in MapViewModel.
    @StateObject private var mapModel = MapViewModel()
    
    var body: some View {
        VStack {
             
            // SwiftUI Map view with specified region and marker.
            Map(
                position: $mapModel.region,
                bounds: nil,
                interactionModes: .all,
                scope: nil
            ) {
                // Marker positioned at specific coordinates (Tower Bridge example).
                Marker("Tower Bridge", coordinate: CLLocationCoordinate2D(latitude: 47.503109, longitude: 8.750700))
            }
            .accentColor(Color(.systemPink)) // Sets accent color for map elements.
            .onAppear {
                // Checks location services status when the view appears.
                mapModel.checkIfLocationServicesIsEnabled()
            }
        }.ignoresSafeArea() // Expands view to the edges of the display.
    }
}

// ViewModel for handling map-related logic.
final class MapViewModel : NSObject, ObservableObject, CLLocationManagerDelegate {
    
    // Published property to reflect the current region on the map.
    @Published var region = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 47.5031065, longitude: 8.7481622),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    ))
    
    var manager : CLLocationManager? // CLLocationManager instance for location services.
    
    // Checks the location authorization status and updates the region accordingly.
    private func checkLocationAuthorization() {
        guard let manager = manager else { return }
        
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization() // Requests location permission.
        case .restricted:
            print("Your device is restricted from using location services.")
        case .denied:
            print("Location services denied. Please enable them in settings.")
        case .authorizedAlways, .authorizedWhenInUse:
            // Updates region to user's current location if available.
            region = MapCameraPosition.region(MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: manager.location?.coordinate.latitude ?? 47.503109,
                    longitude: manager.location?.coordinate.longitude ?? 8.750700
                ),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            ))
        @unknown default:
            break
        }
    }

    // Checks if location services are enabled and initializes CLLocationManager.
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            manager = CLLocationManager()
            manager?.desiredAccuracy = kCLLocationAccuracyBest
            manager!.delegate = self
        } else {
            print("Location services are not enabled. Please enable them.")
        }
    }
    
    // CLLocationManagerDelegate method to handle authorization changes.
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
