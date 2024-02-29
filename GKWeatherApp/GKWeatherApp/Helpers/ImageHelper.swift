//
//  ImageHelper.swift
//  GKWeatherApp
//
//  Created by Tasneem Patel on 2024/02/29.
//

import Foundation
import SwiftUI

struct ImageHelper {
    
    static func getWeatherIconFor(icon: String) -> Image {
        switch icon {
            case "01d":
                return Image("sun")
            case "01n":
                return Image("moon")
            case "02d":
                return Image("cloudSun")
            case "02n":
                return Image("cloudMoon")
            case "03d":
                return Image("cloud")
            case "03n":
                return Image("cloudMoon")
            case "04d":
                return Image("cloudMax")
            case "04n":
                return Image("cloudMoon")
            case "09d":
                return Image("rainy")
            case "09n":
                return Image("rainy")
            case "10d":
                return Image("rainySun")
            case "10n":
                return Image("rainyMoon")
            case "11d":
                return Image("thunderstormSun")
            case "11n":
                return Image("thunderstormMoon")
            case "13d":
                return Image("snowy")
            case "13n":
                return Image("snowy-2")
            case "50d":
                return Image("tornado")
            case "50n":
                return Image("tornado")
            default:
                return Image("moon")
        }
    }
}
