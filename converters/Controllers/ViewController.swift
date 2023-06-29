//
//  ViewController.swift
//  converters
//
//  Created by Rodrigo Amora on 05/06/23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // MARK: - IBOutlets
    @IBOutlet var lbAskTemperature: UILabel!
    @IBOutlet var inputTemperature: UITextField!
    @IBOutlet var lbResult: UILabel!
    @IBOutlet var btConvertTemperature: UIButton!
    @IBOutlet var pickerTemperature: UIPickerView!
    
    // MARK: - Atributes
    let dataArray = [String(localized: "celsius_to_fahrenheit"), String(localized: "fahrenheit_to_celsius")]
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
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
    func initViews() {
        btConvertTemperature.titleLabel?.text = "OK"
        
        inputTemperature.placeholder = String(localized: "type_temperature")
        lbAskTemperature.text = String(localized: "convert_temperature")
        lbResult.text = ""
        
        pickerTemperature.delegate = self as UIPickerViewDelegate
        pickerTemperature.dataSource = self as UIPickerViewDataSource
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

