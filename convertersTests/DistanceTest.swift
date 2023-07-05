//
//  DistanceTest.swift
//  convertersTests
//
//  Created by Rodrigo Amora on 04/07/23.
//

import XCTest
@testable import converters

final class DistanceTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testConveterKilometerToMile() {
        let distanceConverted = DistanceService.kilometerToMile(1)
        let distanceConverted2 = DistanceService.kilometerToMile(20)
        
        XCTAssertEqual("0.62 mi", distanceConverted)
        XCTAssertEqual("12.43 mi", distanceConverted2)
    }

    func testConveterMileToKilometer() {
        let distanceConverted = DistanceService.mileToKilometer(1)
        let distanceConverted2 = DistanceService.mileToKilometer(20)
        
        XCTAssertEqual("1.61 km", distanceConverted)
        XCTAssertEqual("32.19 km", distanceConverted2)
    }
}
