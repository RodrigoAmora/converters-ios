//
//  TemperatureService.swift
//  converters
//
//  Created by Rodrigo Amora on 14/06/23.
//

import Foundation

class TemperatureService {
    func fahrenheitToCelsius(temperature: Double) -> Double {
        return ((temperature - 32)*5)/9
    }
    
    func celisusToFahrenheit(temperature: Double) -> Double {
        return (temperature * 9/5) + 32
    }
}
