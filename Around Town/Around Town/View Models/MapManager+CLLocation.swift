//
//  MapManager+CLLocation.swift
//  Around Town
//
//  Created by Nader Alfares on 2/22/22.
//

import Foundation
import CoreLocation

extension MapManager {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedAlways, .authorizedWhenInUse:
            showsUserLocation = true
            locationManager.startUpdatingLocation()
            userTrackingMode = .follow
        default:
            locationManager.stopUpdatingLocation()
            showsUserLocation = false
            userTrackingMode = .none
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
    
    
}
