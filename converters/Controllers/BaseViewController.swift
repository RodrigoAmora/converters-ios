//
//  BaseViewController.swift
//  converters
//
//  Created by Rodrigo Amora on 01/07/23.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    func changeViewControllerWithPresent(_ viewController: UIViewController) {
        self.present(viewController, animated: true)
    }
    
    func changeTab(_ selectedIndex: Int) {
        self.tabBarController?.selectedIndex = selectedIndex
    }
    
    func getVersionApp() -> String? {
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        return appVersion
    }
    
    func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    func showAlertController(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: String(localized: "btn_alert_view_positive"), style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func configureRightBarButtonItem() {
        let temperature = UIAction(title: String(localized: "menu_convert_temperatue"), image: UIImage(named: "ic_temperature")) { _ in
            self.changeTab(0)
        }
        
        let distance = UIAction(title: String(localized: "menu_convert_distance"), image: UIImage(named: "ic_distance")) { _ in
            self.changeTab(1)
        }
        
        let about = UIAction(title: String(localized: "menu_aboout"), image: UIImage(systemName: "info.circle.fill")) { _ in
            self.changeViewControllerWithPresent(AboutViewController())
        }
        
        let btRightMenu = UIBarButtonItem()
        btRightMenu.image = UIImage(systemName: "text.justify")
        btRightMenu.menu = UIMenu(title: "", children: [temperature, distance, about])
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.blue
        
        let textColor = [NSAttributedString.Key.foregroundColor: UIColor.white]
        appearance.titleTextAttributes = textColor
        
        self.tabBarController?.navigationController?.navigationBar.standardAppearance = appearance
        self.tabBarController?.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        self.tabBarController?.navigationController?.navigationBar.tintColor = .white
        
        self.tabBarController?.navigationItem.title = String(localized: "app_name")
        self.tabBarController?.navigationItem.rightBarButtonItem = btRightMenu
    }
}
