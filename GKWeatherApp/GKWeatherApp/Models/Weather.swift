//
//  Weather.swift
//  GKWeatherApp
//
//  Created by Tasneem Patel on 2024/02/29.
//

import Foundation

struct WeatherResponse: Codable {
    
    var current: Weather
    var hourly: [Weather]
    var daily: [WeatherDaily]

    static func empty() -> WeatherResponse {
        
        WeatherResponse(
            current: Weather(),
            hourly: [Weather](repeating: Weather(),
                              count: 24),
            daily: [WeatherDaily](repeating: WeatherDaily(),
                                  count: 8)
        )
    }
}

struct Weather: Codable, Identifiable {
    
    var id: UUID = UUID()
    var temp: Double
    var date: Int
    var weather: [WeatherDetail]
    var feelsLike: Double
    var clouds: Int
    var humidity: Int
    var pressure: Int
    var dewPoint: Double
    var windSpeed: Double
    var windDeg: Int
    
    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case date = "dt"
        case weather = "weather"
        case feelsLike = "feels_like"
        case clouds = "clouds"
        case humidity = "humidity"
        case pressure = "pressure"
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        
    }

    init() {
        temp = 0.0
        date = 0
        weather = []
        feelsLike = 0.0
        clouds = 0
        pressure = 0
        humidity = 0
        dewPoint = 0.0
        windSpeed = 0.0
        windDeg = 0
    }
}

struct WeatherDetail: Codable, Identifiable {
    
    var main: String
    var description: String
    var icon: String
    var id: Int {
        0
    }
}

struct WeatherDaily: Codable, Identifiable {
    
    var date: Int
    var temp: WeatherTemperature
    var weather: [WeatherDetail]
    var id: UUID {
        UUID()
    }

    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case temp = "temp"
        case weather = "weather"
    }

    init() {
        date = 0
        temp = WeatherTemperature(min: 0.0, max: 0.0)
        weather = [WeatherDetail(main: "",
                                 description: "",
                                 icon: "")]
    }
}

struct WeatherTemperature: Codable {
    
    var min: Double
    var max: Double
}
