//
//  ViewController.swift
//  openApi
//
//  Created by 오현민 on 6/24/24.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    
    let weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchWeatherData()
    }
    
    private func fetchWeatherData() {
        weatherManager.fetchWeather { [weak self] data in
            guard let self = self else { return }
            self.weatherData = data
        }
    }
    
    private var weatherData: WeatherData? {
        didSet {
            DispatchQueue.main.async {
                self.updateUI()
            }
        }
    }
    
    private func updateUI() {
        if let weather = weatherData {
            tempLabel.text = "\(weather.main.temp)°C"
            locationLabel.text = weather.weather.first?.description.capitalized
            if let icon = weather.weather.first?.icon {
                updateWeatherImage(icon: icon)
            }
        } else {
            //weatherLabel.text = "날씨 정보를 불러오는 중..."
        }
    }
    
    private func updateWeatherImage(icon: String) {
        let imageUrl = "https://openweathermap.org/img/wn/\(icon)@2x.png"
        if let url = URL(string: imageUrl) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.weatherImageView.image = UIImage(data: data)
                    }
                }
            }
        }
    }
}
