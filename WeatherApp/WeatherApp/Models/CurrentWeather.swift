//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Yuliya Lapenak on 11/11/22.
//

import Foundation

struct CurrentWeather {
    
    let cityName: String
    
    let temp: Double
    var tempString: String {
        return "\(temp.rounded())"
    }
    
    let feelsLikeTemp: Double
    var feelsLikeTempString: String {
        return "\(feelsLikeTemp.rounded())"
    }
    let conditionCode: Int
    
    init?(currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.name
        temp = currentWeatherData.main.temp
        feelsLikeTemp = currentWeatherData.main.feelsLike
        conditionCode = currentWeatherData.weather.first!.id
    }
}
