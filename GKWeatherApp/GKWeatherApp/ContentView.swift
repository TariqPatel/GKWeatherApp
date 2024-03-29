import SwiftUI
import CoreLocation

struct ContentView: View {
    @State private var locationManager = CLLocationManager()
    @State private var locationDelegate = LocationDelegate()
    @State private var isButtonVisible = false
    @State private var isLocationAvailable = false
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    requestLocation()
                    isButtonVisible = true
                }) {
                    Text("Get Current Location")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                
                if isButtonVisible && isLocationAvailable {
                    NavigationLink(destination: HomeView(homeViewModel: HomeViewModel(latitude: locationDelegate.getLatitude(), longitude: locationDelegate.getLongitude()))) {
                        Text("Show Today's Weather")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding()
                }
            }
            .background(Color(UIColor.systemBackground)) // Background color similar to iOS
            .navigationBarTitle("GK Weather App")
            .font(.headline) // Use a specific font if needed
            .onAppear {
                setupLocationManager()
                requestLocation()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Use StackNavigationViewStyle for iOS 14 and later
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
                isLocationAvailable = true
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
