//
//  UIExtension.swift
//  converters
//
//  Created by Rodrigo Amora on 17/05/25.
//

import UIKit

extension UISearchBar {
    func posY() {
        let searchBarPosY: CGFloat = switch UIDevice.current.userInterfaceIdiom {
            case .pad:
                75
            
            case .phone:
                95
            
            default:
                85
        }
        
        self.frame.origin.y = searchBarPosY
    }
}
