//
//  HomeViewModel.swift
//  GKWeatherApp
//
//  Created by Tasneem Patel on 2024/02/29.
//

import Foundation
import SwiftUI
import CoreLocation

final class HomeViewModel: ObservableObject {
    
    @Published var weather = WeatherResponse.empty()
    @Published var cityLocation = Constants.Strings.city {
        didSet {
            createWeatherURL(LocationHelper.getLocation(cityLocation))
        }
    }

    init() {
        createWeatherURL(LocationHelper.getLocation(cityLocation))
    }
    
    private func createWeatherURL(_ coordinates: CLLocationCoordinate2D?) {
        var urlString = ""
        if let coordinates = coordinates {
            urlString = getCurrentWeatherURL(latitude: coordinates.latitude, longitude: coordinates.longitude)
        } else {
            urlString = getCurrentWeatherURL(latitude: -33.918861, longitude: 18.423300)
        }
        getWeather(cityLocation: cityLocation, for: urlString)
    }
    
    func getCurrentWeatherURL(latitude: Double, longitude: Double) -> String {
        let baseURL = Constants.Strings.url
        let key = Constants.Strings.keyAPI
        return "\(baseURL)/onecall?lat=\(latitude)&lon=\(longitude)&appid=\(key)&exclude=minutely&units=metric"
    }
    
    private func getWeather(cityLocation: String, for urlString: String) {
        guard let url = URL(string: urlString) else {return}
        NetworkService<WeatherResponse>.fetchData(for: url) { (result) in
            switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        self.weather = response
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
}
