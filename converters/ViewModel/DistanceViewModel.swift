//
//  DistanceViewModel.swift
//  converters
//
//  Created by Rodrigo Amora on 30/10/23.
//

import Foundation

class DistanceViewModel {
    
    // MARK: - Atributes
    private var viewDelegate: ViewDelegate
    
    // MARK: - init
    init(viewDelegate: ViewDelegate) {
        self.viewDelegate = viewDelegate
    }
    
    // MARK: - Methods
    func kilometerToMile(_ distance: Double) {
        let distanceConverted = DistanceService.kilometerToMile(distance)
        self.viewDelegate.updateView(result: distanceConverted)
    }
    
    func mileToKilometer(_ distance: Double) {
        let distanceConverted = DistanceService.mileToKilometer(distance)
        self.viewDelegate.updateView(result: distanceConverted)
    }
    
}
