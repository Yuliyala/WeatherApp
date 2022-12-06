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
        networkWeatherManager.fetchCurrentWeather(city: "London")
        networkWeatherManager.onCompletion = { currentWeather in
            print(currentWeather.cityName)
        }
    }
    
    @IBAction func enterCityButton(_ sender: UIButton) {
        presentSearchAlertController(withTitle: "Enter city's name", message: nil, style: .alert) { city in
            self.networkWeatherManager.fetchCurrentWeather(city: city)
            
        }
    }
}

