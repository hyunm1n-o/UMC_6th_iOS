//
//  WeatherManager.swift
//  openApi
//
//  Created by 오현민 on 6/24/24.
//


import Foundation

class WeatherManager {
    let apiKey = "16e7fe92e790023ce75b1bf2a90758a5"
    lazy var urlString: String = "https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=\(apiKey)&units=metric"
    
    func fetchWeather(completion: @escaping (WeatherData?) -> Void) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    completion(nil)
                    return
                }
                if let safeData = data {
                    let decoder = JSONDecoder()
                    do {
                        let weatherData = try decoder.decode(WeatherData.self, from: safeData)
                        completion(weatherData)
                    } catch {
                        print(error)
                        completion(nil)
                    }
                }
            }
            task.resume()
        }
    }
}
