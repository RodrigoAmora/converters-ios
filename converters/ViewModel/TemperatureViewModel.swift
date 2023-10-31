//
//  TemperatureViewModel.swift
//  converters
//
//  Created by Rodrigo Amora on 30/10/23.
//

import Foundation

class TemperatureViewModel {
    
    func celisusToFahrenheit(_ temperature: Double) -> String {
        return TemperatureService.celisusToFahrenheit(temperature: temperature ?? 0)
    }
    
    func fahrenheitToCelsius(_ temperature: Double) -> String {
        return TemperatureService.fahrenheitToCelsius(temperature: temperature ?? 0)
    }
    
}
