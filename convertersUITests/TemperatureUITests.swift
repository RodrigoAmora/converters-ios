//
//  TemperatureUITests.swift
//  convertersUITests
//
//  Created by Rodrigo Amora on 22/11/23.
//

import XCTest

class TemperatureUITests: XCTestCase {
    
    // MARK: - Atributes
    var app: XCUIApplication!

    // MARK: - XCTestCase Methods
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["testing"]
        app.launch()
    }
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {}
    
    // MARK: - Test Methods
    func testConverterCelsiusToFahrenheit() throws {
        let temperatureTextField = app.textFields.element(matching: .textField, identifier: "inputTemperature")
        temperatureTextField.typeText("32")
        
        app.buttons.element(matching: .button, identifier: "btConvert").tap()
        
        
        let temperatureResultLabel = app.textViews.element(matching: .textView, identifier: "lbTemperatureConverted")
        XCTAssertEqual("89,6 ºF", temperatureResultLabel.label)
    }
}
