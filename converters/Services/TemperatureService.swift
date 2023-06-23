//
//  TemperatureService.swift
//  converters
//
//  Created by Rodrigo Amora on 14/06/23.
//

import Foundation

class TemperatureService {
    class func fahrenheitToCelsius(temperature: Double) -> Double {
        return ((temperature - 32)*5)/9
    }
    
    class func celisusToFahrenheit(temperature: Double) -> Double {
        return (temperature * 9/5) + 32
    }
}
