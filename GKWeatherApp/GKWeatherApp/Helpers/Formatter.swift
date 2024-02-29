//
//  Formatter.swift
//  GKWeatherApp
//
//  Created by Tasneem Patel on 2024/02/29.
//

import Foundation

struct Formatter {
    
    public static func temperature(_ temperature: Double) -> String {
        return String(format: "%1.0f", temperature)
    }
    
    public static func getDayFor(_ temperature: Int) -> String {
        return dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(temperature)))
    }
    
    public static func getDayNumber(_ temperature: Int) -> String {
        return dayNumberFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(temperature)))
    }
    
    public static func weatherIcon(_ icon: String) -> String {
        if icon == "" {
            return "moon"
        }
        return icon
    }
    
    public static let defaultDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()

    public static let dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter
    }()
    
    public static let dayNumberFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        return formatter
    }()

    public static let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh a"
        return formatter
    }()
}
