//
//  DistanceService.swift
//  converters
//
//  Created by Rodrigo Amora on 29/06/23.
//

import Foundation

class DistanceService {
    class func kilometerToMile(_ distance: Double) -> Double {
        return distance * 0.621371
    }
    
    class func mileToKilometer(_ distance: Double) -> Double {
        return distance * 1.609344
    }
}
