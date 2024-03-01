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
    @Published var latitude = 0.0
    @Published var longitude = 0.0

    init(latitude: Double = 0.0, longitude: Double = 0.0) {
        self.latitude = latitude
        self.longitude = longitude
        createWeatherURL(latitude: latitude, longitude: longitude)
    }
    
    private func createWeatherURL(latitude: Double, longitude: Double) {
        var urlString = ""
        urlString = getCurrentWeatherURL(latitude: latitude, longitude: longitude)
        getWeather(for: urlString)
    }
    
    func getCurrentWeatherURL(latitude: Double, longitude: Double) -> String {
        let baseURL = Constants.Strings.url
        let key = Constants.Strings.keyAPI
        return "\(baseURL)/onecall?lat=\(latitude)&lon=\(longitude)&appid=\(key)&exclude=minutely&units=metric"
    }
    
    private func getWeather(for urlString: String) {
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
