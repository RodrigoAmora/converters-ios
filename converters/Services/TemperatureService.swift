//
//  TemperatureService.swift
//  converters
//
//  Created by Rodrigo Amora on 14/06/23.
//

import Foundation

class TemperatureService {
    class func fahrenheitToCelsius(temperature: Double) -> String {
        let temperatureConverted = ((temperature - 32)*5)/9
        return "\(temperatureConverted.formatNumberToDecimal()) ºC"
    }
    
    class func celisusToFahrenheit(temperature: Double) -> String {
        let temperatureConverted = (temperature * 9/5) + 32
        return "\(temperatureConverted.formatNumberToDecimal()) ºF"
    }
}
