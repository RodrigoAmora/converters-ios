//
//  TemperatureViewModel.swift
//  converters
//
//  Created by Rodrigo Amora on 30/10/23.
//

import Foundation

class TemperatureViewModel {
    
    // MARK: - Atributes
    private var viewDelegate: ViewDelegate
    
    // MARK: - init
    init(viewDelegate: ViewDelegate) {
        self.viewDelegate = viewDelegate
    }
    
    // MARK: - Methods
    func celisusToFahrenheit(_ temperature: Double) {
        let temperatureConverted = TemperatureService.celisusToFahrenheit(temperature: temperature)
        self.viewDelegate.updateView(result: temperatureConverted)
    }
    
    func fahrenheitToCelsius(_ temperature: Double) {
        let temperatureConverted = TemperatureService.fahrenheitToCelsius(temperature: temperature)
        self.viewDelegate.updateView(result: temperatureConverted)
    }
    
}
