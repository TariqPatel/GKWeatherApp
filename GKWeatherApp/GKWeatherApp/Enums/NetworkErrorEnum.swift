//
//  NetworkErrorEnum.swift
//  GKWeatherApp
//
//  Created by Tasneem Patel on 2024/02/29.
//

import Foundation

enum NetworkError: Error {
    
    case error(error: String)
    case dataInvalid
    case responseInvalid
    case errorDecoding(error: String)
}
