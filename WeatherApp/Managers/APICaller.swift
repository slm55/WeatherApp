//
//  APICaller.swift
//  WeatherApp
//
//  Created by Aslan Murat on 15.05.2022.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    private let apiKey = "e0598dcebf45fc5a34b828d69fa78de0"
    
    enum APIError: Error {
           case faileedToGetData
       }
    
    public func search(with query: String, completion: @escaping (Result<CityWeather, Error>) -> Void) {

        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")&appid=\(apiKey)") else {
            return
        }
        
        print(url.absoluteString)
        
        var request = URLRequest(url: url)
        request.httpMethod = "get"
        request.timeoutInterval = 30


                let task = URLSession.shared.dataTask(with: request) { data, response, error in
                    guard let data = data, error == nil else {
                        completion(.failure(APIError.faileedToGetData))
                        return
                    }
                    
                    do {
                        let result1 = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                        print(result1)
                        let result = try JSONDecoder().decode(CityWeather.self, from: data)
                        print(result)
                        completion(.success(result))
                    }
                    catch {
                        completion(.failure(error))
                    }
                }
                task.resume()
            
        }
}
