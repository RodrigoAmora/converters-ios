//
//  TemperatureTests.swift
//  convertersTests
//
//  Created by Rodrigo Amora on 04/07/23.
//

import XCTest
@testable import converters

final class TemperatureTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testsConverterCelsiustoFahrenheit() {
        let temperatureConverted = TemperatureService.celisusToFahrenheit(temperature: 0)
        let temperatureConverted2 = TemperatureService.celisusToFahrenheit(temperature: 100)
        
        XCTAssertEqual("32 ºF", temperatureConverted)
        XCTAssertEqual("212 ºF", temperatureConverted2)
    }

    func testsConverterFahrenheitToCelsius() {
        let temperatureConverted = TemperatureService.fahrenheitToCelsius(temperature: 32)
        let temperatureConverted2 = TemperatureService.fahrenheitToCelsius(temperature: 100)
        
        XCTAssertEqual("0 ºC", temperatureConverted)
        XCTAssertEqual("37,78 ºC", temperatureConverted2)
    }
    
    func testsConverterCelsiustoFahrenheitWithNegativeTemperature() {
        let temperatureConverted = TemperatureService.celisusToFahrenheit(temperature: -22)
        let temperatureConverted2 = TemperatureService.celisusToFahrenheit(temperature: -110.5)
        
        XCTAssertEqual("-7,6 ºF", temperatureConverted)
        XCTAssertEqual("-166,9 ºF", temperatureConverted2)
    }
    
    func testsConverterFahrenheitToCelsiusWithNegativeTemperature() {
        let temperatureConverted = TemperatureService.fahrenheitToCelsius(temperature: -22)
        let temperatureConverted2 = TemperatureService.fahrenheitToCelsius(temperature: -110.5)
        
        XCTAssertEqual("-30 ºC", temperatureConverted)
        XCTAssertEqual("-79,17 ºC", temperatureConverted2)
    }
}
