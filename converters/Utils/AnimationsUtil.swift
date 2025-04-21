//
//  AnimationsUtil.swift
//  converters
//
//  Created by Rodrigo Amora on 10/04/25.
//

import Foundation
import UIKit

class AnimationsUtil {
    class func flipFromBottom(view: UIView, duration: Double) {
        UIView.transition(with: view,
                          duration: duration,
                          options: .transitionFlipFromBottom,
                          animations: {
                            view.isHidden = false
                          }
        )
    }
}
