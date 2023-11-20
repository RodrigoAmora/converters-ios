//
//  DoubleExtension.swift
//  converters
//
//  Created by Rodrigo Amora on 20/11/23.
//

import Foundation

extension Double {
    func formatNumberToDecimal() -> String {
        let numberFormatter = NumberFormatter()

        // Atribuindo o locale desejado
        numberFormatter.locale = Locale.current

        // Importante para que sejam exibidas as duas casas após a vírgula
        numberFormatter.maximumFractionDigits = 2

        numberFormatter.numberStyle = .decimal

        return numberFormatter.string(from: NSNumber(value: self)) ?? String(localized: "undefined_value")
    }
}
