//
//  DistanceViewModel.swift
//  converters
//
//  Created by Rodrigo Amora on 30/10/23.
//

import Foundation

class DistanceViewModel {
    
    func kilometerToMile(_ distance: Double) -> String {
        return DistanceService.kilometerToMile(distance ?? 0)
    }
    
    func mileToKilometer(_ distance: Double) -> String {
        return DistanceService.mileToKilometer(distance ?? 0)
    }
    
}
