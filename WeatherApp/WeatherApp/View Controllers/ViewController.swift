//
//  ViewController.swift
//  WeatherApp
//
//  Created by Yuliya Lapenak on 11/8/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var networkWeatherManager = NetworkWeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkWeatherManager.onCompletion = { [weak self] currentWeather in
            guard let self = self else { return }
            self.updateInterfaceWith(weather: currentWeather)
        }
        networkWeatherManager.fetchCurrentWeather(city: "London")
    }
    
    @IBAction func enterCityButton(_ sender: UIButton) {
        presentSearchAlertController(withTitle: "Enter city's name", message: nil, style: .alert) {[unowned self] city in
            self.networkWeatherManager.fetchCurrentWeather(city: city)
            
        }
    }
    
    func updateInterfaceWith(weather: CurrentWeather) {
        DispatchQueue.main.async {
            self.cityLabel.text = weather.cityName
            self.tempLabel.text = weather.tempString
            self.feelsLikeLabel.text = weather.feelsLikeTempString
            self.weatherImageView.image = UIImage(systemName: weather.systemIconNameString)
        }
    }
}

