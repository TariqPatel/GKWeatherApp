//
//  LocationHelper.swift
//  GKWeatherApp
//
//  Created by Tasneem Patel on 2024/02/29.
//

import Foundation
import CoreLocation

struct LocationHelper {
    public static func getLocation(_ city: String) -> CLLocationCoordinate2D? {
        var location: CLLocationCoordinate2D?
        CLGeocoder().geocodeAddressString(city) { (placemarks, error) in
            if let places = placemarks,
               let place = places.first {
                location = place.location?.coordinate ?? nil
            }
        }
        return location
    }
}
