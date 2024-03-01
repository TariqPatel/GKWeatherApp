//
//  LocationHelper.swift
//  GKWeatherApp
//
//  Created by Tasneem Patel on 2024/02/29.
//

import Foundation
import CoreLocation

class LocationDelegate: NSObject, CLLocationManagerDelegate {
    var latitude = 0.0
    var longitude = 0.0
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            latitude = location.coordinate.latitude
            longitude = location.coordinate.longitude
        }
    }
    
    func getLatitude() -> Double {
       return latitude
    }
    
    func getLongitude() -> Double {
       return longitude
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location request failed with error: \(error.localizedDescription)")
    }
}
