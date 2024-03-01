import SwiftUI
import CoreLocation

class LocationDelegate: NSObject, CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("Latitude: \(location.coordinate.latitude), Longitude: \(location.coordinate.longitude)")
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location request failed with error: \(error.localizedDescription)")
    }
}

struct ContentView: View {
    @State private var locationManager = CLLocationManager()
    @State private var locationDelegate = LocationDelegate()

    var body: some View {
        VStack {
            Text("Your App Content Here")

            Button("Get Location") {
                requestLocation()
            }
        }
        .onAppear {
            setupLocationManager()
            requestLocation()
        }
    }
    
    private func setupLocationManager() {
        locationManager.delegate = locationDelegate
    }

    func requestLocation() {
        if CLLocationManager.locationServicesEnabled() {
            // Check the current authorization status
            let authorizationStatus = CLLocationManager.authorizationStatus()

            switch authorizationStatus {
            case .authorizedWhenInUse, .authorizedAlways:
                // Location services are already authorized, start updating location
                locationManager.startUpdatingLocation()

            case .notDetermined:
                // Request location authorization
                locationManager.requestWhenInUseAuthorization()

            case .restricted, .denied:
                // Handle case where user has denied or restricted location access
                print("Location access denied. Please enable it in settings.")
            @unknown default:
                break
            }
        } else {
            print("Location services are not enabled.")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
