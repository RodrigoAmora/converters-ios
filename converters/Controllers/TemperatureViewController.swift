//
//  TemperatueController.swift
//  converters
//
//  Created by Rodrigo Amora on 29/06/23.
//

import Foundation
import UIKit

class TemperatureViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var btConvertTemperature: UIButton!
    @IBOutlet weak var inputTemperature: UITextField!
    @IBOutlet weak var lbAskTemperature: UILabel!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var pickerTemperature: UIPickerView!
    
    // MARK: - Atributes
    private lazy var viewModel: TemperatureViewModel = TemperatureViewModel(viewDelegate: self)
    private let dataArray = [String(localized: "celsius_to_fahrenheit"), String(localized: "fahrenheit_to_celsius")]
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initViews()
        self.configureDelegates()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.configureRightBarButtonItem()
    }
    
    // MARK: - Methods
    private func initViews() {
        self.btConvertTemperature.accessibilityIdentifier = "btConvert"
        self.btConvertTemperature.setTitle(String(localized: "btn_convert_temperature"), for: .normal)
        self.btConvertTemperature.overrideUserInterfaceStyle = .light
        
        self.lbAskTemperature.text = String(localized: "convert_temperature")
        self.lbAskTemperature.overrideUserInterfaceStyle = .light
        
        self.inputTemperature.accessibilityIdentifier = "inputTemperature"
        self.inputTemperature.placeholder = String(localized: "type_temperature")
        self.inputTemperature.keyboardType = .numbersAndPunctuation
        self.inputTemperature.overrideUserInterfaceStyle = .light
        
        self.lbResult.accessibilityIdentifier = "lbTemperatureConverted"
        self.lbResult.text = ""
        self.lbResult.overrideUserInterfaceStyle = .light
        
        self.pickerTemperature.overrideUserInterfaceStyle = .light
    }
    
    private func configureDelegates() {
        self.pickerTemperature.delegate = self
        self.pickerTemperature.dataSource = self
        
        self.inputTemperature.delegate = self
    }
    
    // MARK: - IBActions
    @IBAction func convertTemperature() {
        self.hideKeyboard()
        
        let temperature = inputTemperature.text?.replacingOccurrences(of: ",", with: ".") ?? ""
        if (temperature.isEmpty) {
            self.showAlertController(title: "", message: String(localized: "temperature_empty"))
            return
        }
        
        let temperatureTyped = Double(temperature)
        
        let index = pickerTemperature.selectedRow(inComponent: 0)
        switch index {
        case 0:
            self.viewModel.celisusToFahrenheit(temperatureTyped ?? 0)
            break
            
        case 1:
            self.viewModel.fahrenheitToCelsius(temperatureTyped ?? 0)
            break
            
        default:
            break
        }
    }
    
}

// MARK: - UIPickerViewDelegate
extension TemperatureViewController: UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}

// MARK: - UIPickerViewDataSource
extension TemperatureViewController: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.dataArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let row = self.dataArray[row]
        return row
    }
}


// MARK: - UITextFieldDelegate
extension TemperatureViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let aSet = NSCharacterSet(charactersIn:"0123456789.,-").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        
        return string == numberFiltered
    }
}

// MARK: - ViewDelegate
extension TemperatureViewController: ViewDelegate {
    func updateView(result: String) {
        self.lbResult.text = result
        AnimationsUtil.showIn(view: self.lbResult, duration: 3)
    }
}
