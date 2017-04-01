//
//  Constants.swift
//  WeatherApp
//
//  Created by Brian Leip on 4/1/17.
//  Copyright © 2017 TorchFire. All rights reserved.
//

import Foundation

// original API web request = http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=3574f1c4a9c0a0e05bd3835b53574817

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LAT_TEXT = "lat="
let LATITUDE = "34"
let LON_TEXT = "&lon="
let LONGITUDE = "118"
let APP_ID = "&appid="
let API_KEY = "3574f1c4a9c0a0e05bd3835b53574817"

let WEATHER_API_URL = BASE_URL + LAT_TEXT + LATITUDE + LON_TEXT + LONGITUDE + APP_ID + API_KEY
