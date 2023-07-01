//
//  BaseViewController.swift
//  converters
//
//  Created by Rodrigo Amora on 01/07/23.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    func showAlertController(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: String(localized: "btn_alert_view_positive"), style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
