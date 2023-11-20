//
//  DistanceService.swift
//  converters
//
//  Created by Rodrigo Amora on 29/06/23.
//

import Foundation

class DistanceService {
    class func kilometerToMile(_ distance: Double) -> String {
        let distanceConverted = distance * 0.621371
        return "\(distanceConverted.formatNumberToDecimal()) mi"
    }
    
    class func mileToKilometer(_ distance: Double) -> String {
        let distanceConverted = distance * 1.609344
        return "\(distanceConverted.formatNumberToDecimal()) km"
    }
}
