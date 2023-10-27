//
//  TemperatueController.swift
//  converters
//
//  Created by Rodrigo Amora on 29/06/23.
//

import Foundation
import UIKit

class TemperatureViewController: BaseViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet weak var btRightMenu: UIBarButtonItem!
    @IBOutlet weak var btConvertTemperature: UIButton!
    @IBOutlet weak var inputTemperature: UITextField!
    @IBOutlet weak var lbAskTemperature: UILabel!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var pickerTemperature: UIPickerView!
    @IBOutlet weak var navBar: UINavigationBar!
    
    // MARK: - Atributes
    let dataArray = [String(localized: "celsius_to_fahrenheit"), String(localized: "fahrenheit_to_celsius")]
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initViews()
        self.configureDelegates()
        self.configureRightBarButtonItem()
    }
    
    // MARK: - UIPickerViewDelegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // MARK: - UIPickerViewDataSource
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let row = dataArray[row]
        return row
    }
    
    // MARK: - UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let aSet = NSCharacterSet(charactersIn:"0123456789.,-").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        
        return string == numberFiltered
    }
    
    // MARK: - Methods
    private func initViews() {
        self.btConvertTemperature.setTitle(String(localized: "btn_convert_temperature"), for: .normal)
        self.btConvertTemperature.overrideUserInterfaceStyle = .light
        
        self.lbAskTemperature.text = String(localized: "convert_temperature")
        self.lbAskTemperature.overrideUserInterfaceStyle = .light
        
        self.inputTemperature.placeholder = String(localized: "type_temperature")
        self.inputTemperature.keyboardType = .numbersAndPunctuation
        self.inputTemperature.overrideUserInterfaceStyle = .light
        
        self.lbResult.text = ""
        self.lbResult.overrideUserInterfaceStyle = .light
        
        self.pickerTemperature.overrideUserInterfaceStyle = .light
    }
    
    private func configureDelegates () {
        self.pickerTemperature.delegate = self as UIPickerViewDelegate
        self.pickerTemperature.dataSource = self as UIPickerViewDataSource
        
        self.inputTemperature.delegate = self
    }
    
    private func configureRightBarButtonItem() {
        let temperature = UIAction(title: String(localized: "menu_convert_temperatue"), image: UIImage(named: "ic_temperature")) { _ in
            self.changeTab(0)
        }
        
        let distance = UIAction(title: String(localized: "menu_convert_distance"), image: UIImage(named: "ic_distance")) { _ in
            self.changeTab(1)
        }
        
        self.btRightMenu.image = UIImage(systemName: "text.justify")
        self.btRightMenu.menu = UIMenu(title: "", children: [temperature, distance])
        
        self.navBar.topItem?.title = String(localized: "app_name")
        self.navBar.backgroundColor = UIColor.blue
    }
    
    // MARK: - IBActions
    @IBAction func convertTemperature() {
        let temperature = inputTemperature.text ?? ""
        if (temperature.isEmpty) {
            showAlertController(title: "", message: String(localized: "temperature_empty"))
            return
        }
        
        let temperatureTyped = Double(temperature)
        var temperatureConverted: String = ""
        
        let index = pickerTemperature.selectedRow(inComponent: 0)
        switch index {
        case 0:
            temperatureConverted = TemperatureService.celisusToFahrenheit(temperature: temperatureTyped ?? 0)
            break
            
        case 1:
            temperatureConverted = TemperatureService.fahrenheitToCelsius(temperature: temperatureTyped ?? 0)
            break
            
        default:
            break
        }
        
        self.lbResult.text = temperatureConverted
    }
    
}
