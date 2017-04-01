//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Brian Leip on 4/1/17.
//  Copyright © 2017 TorchFire. All rights reserved.
//

import Foundation
import Alamofire

class CurrentWeather {
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today: \(currentDate)"
        
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    func downloadWeatherDetails(completed: DownloadComplete) {
        //Almofire download
        let currentWeatherURL = URL(string: WEATHER_API_URL)!
        Alamofire.request(currentWeatherURL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                // get city name
                if let name = dict["name"] as? String! {
                    self._cityName = name
                }
                print(self._cityName)
                
                // get weather type
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let type = weather[0]["main"] as? String {
                        self._weatherType = type
                    }
                    print(self._weatherType)
                }
                
                // get current temp
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let temp = main["temp"] as? Double {
//                        let kelvinToFahrenheit = temp * 9/5 - 459.67  // not totally accurate
                        let kelvinToFahrenheit = (9/5 * (temp-273)) + 32
                        self._currentTemp = kelvinToFahrenheit
                        print(self._currentTemp)
                        print(temp * 9/5 - 459.67)
                    }
                }
            }
            

        }
        completed()
    }
    
}
