//
//  NetworkService.swift
//  GKWeatherApp
//
//  Created by Tasneem Patel on 2024/02/29.
//

import Foundation

final class NetworkService<T: Codable> {
    
    static func fetchData(for url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.responseInvalid))
                return
            }
            
            guard error == nil else {
                print(String(describing: error))
                if let error = error?.localizedDescription {
                    completion(.failure(.error(error: error)))
                }
                return
            }
            
            guard let data = data else {
                completion(.failure(.dataInvalid))
                return
            }
            
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
            } catch let error {
                print(String(describing: error))
                completion(.failure(.errorDecoding(error: error.localizedDescription)))
            }
        }.resume()
    }
}
