//
//  ContentView.swift
//  CoreLocationSetup
//
//  Created by Demian Füglistaler on 17.12.2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @StateObject private var mapModel = MapViewModel()
    
    
    


    
    var body: some View {
        VStack {
             
            Map(
                position: $mapModel.region,
                bounds: nil ,
                interactionModes: .all ,
                scope: nil
                
                
            ) {
                Marker("Tower Bridge", coordinate: CLLocationCoordinate2D(latitude: 47.503109, longitude: 8.750700) )
            }
            
            
            .accentColor(Color(.systemPink))
            .onAppear {
                mapModel.checkIfLocationServicesIsEnabled()
            }
            
           
            
        }.ignoresSafeArea()
        
        
        
    }
    

    
}


final class MapViewModel : NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var region = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 47.5031065,
            longitude: 8.7481622
            
        ), span: MKCoordinateSpan(
            latitudeDelta: 0.05,
            longitudeDelta: 0.05 )))
    
    var manager : CLLocationManager?
    
    private func checkLocationAuthorization () {
            guard let manager = manager else { return }
            
            switch manager.authorizationStatus {
                
            case .notDetermined:
                manager.requestWhenInUseAuthorization()
                
            case .restricted:
                print("your device is restricted")
                
            case .denied:
                print("you have denied settings, pls change it")
                
            case .authorizedAlways , .authorizedWhenInUse:
                region = MapCameraPosition.region(MKCoordinateRegion(
                    center: CLLocationCoordinate2D(
                        latitude: manager.location?.coordinate.latitude ?? 47.503109,
                        longitude: manager.location?.coordinate.longitude ?? 8.750700
                        
                    ), span: MKCoordinateSpan(
                        latitudeDelta: 0.05,
                        longitudeDelta: 0.05 )))

            @unknown default:
                break
            }
        }

    func checkIfLocationServicesIsEnabled() {
        
        if CLLocationManager.locationServicesEnabled() {
            
            manager = CLLocationManager()
            manager?.desiredAccuracy = kCLLocationAccuracyBest
            
            manager!.delegate = self
            
        } else {
            
            print ( " LocationService is not enabled pls enable it " )
            
        }
            
    }
    
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
                        
    
}
    
    
    
#Preview {
    MapView()
}
