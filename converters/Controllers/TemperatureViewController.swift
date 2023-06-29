//
//  TemperatueController.swift
//  converters
//
//  Created by Rodrigo Amora on 29/06/23.
//

import Foundation
import UIKit

class TemperatureViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - IBOutlets
    @IBOutlet weak var btRightMenu: UIBarButtonItem!
    @IBOutlet var btConvertTemperature: UIButton!
    @IBOutlet var inputTemperature: UITextField!
    @IBOutlet var lbAskTemperature: UILabel!
    @IBOutlet var lbResult: UILabel!
    @IBOutlet var pickerTemperature: UIPickerView!
    @IBOutlet weak var navBar: UINavigationBar!
    
    // MARK: - Atributes
    let dataArray = [String(localized: "celsius_to_fahrenheit"), String(localized: "fahrenheit_to_celsius")]
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("TemperatureViewController")
        
        self.initViews()
        self.configureRightBarButtonItem()
    }
    
    // MARK: - UIPicker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let row = dataArray[row]
        return row
    }
    
    // MARK: - Methods
    private func initViews() {
        btConvertTemperature.titleLabel?.text = "OK"
        
        inputTemperature.placeholder = String(localized: "type_temperature")
        lbAskTemperature.text = String(localized: "convert_temperature")
        lbResult.text = ""
        
        pickerTemperature.delegate = self as UIPickerViewDelegate
        pickerTemperature.dataSource = self as UIPickerViewDataSource
    }
    
    private func configureRightBarButtonItem() {
        let temperature = UIAction(title: String(localized: "menu_convert_temperatue"), image: UIImage(systemName: "person.circle")) { _ in
            self.changeViewController(TemperatureViewController())
        }
        
        let distance = UIAction(title: String(localized: "menu_convert_distance"), image: UIImage(systemName: "rectangle.portrait.and.arrow.right")) { _ in
            self.changeViewController(DistanceViewController())
        }
        
        btRightMenu.image = UIImage(systemName: "text.justify")
        btRightMenu.menu = UIMenu(title: "", children: [temperature, distance])
        
        navBar.topItem?.title = String(localized: "app_name")
        navBar.backgroundColor = UIColor.blue
    }
    
    private func changeViewController(_ viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    // MARK: - IBActions
    @IBAction func convertTemperature() {
        let temperatureTyped = Double(inputTemperature.text ?? "0")
        var temperatureConverted: Double = 0;
        
        let a = pickerTemperature.selectedRow(inComponent: 0)
        switch a {
        case 0:
            temperatureConverted = TemperatureService.celisusToFahrenheit(temperature: temperatureTyped ?? 0)
            break
            
        case 1:
            temperatureConverted = TemperatureService.fahrenheitToCelsius(temperature: temperatureTyped ?? 0)
            break
            
        default:
            break
        }
        
        lbResult.text = String(temperatureConverted)
    }
    
}
