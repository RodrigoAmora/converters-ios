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
        
        XCTAssertEqual("32.00 ºF", temperatureConverted)
        XCTAssertEqual("212.00 ºF", temperatureConverted2)
    }

    func testsConverterFahrenheitToCelsius() {
        let temperatureConverted = TemperatureService.fahrenheitToCelsius(temperature: 50)
        let temperatureConverted2 = TemperatureService.fahrenheitToCelsius(temperature: 100)
        
        XCTAssertEqual("10.00 ºC", temperatureConverted)
        XCTAssertEqual("37.78 ºC", temperatureConverted2)
    }
}
