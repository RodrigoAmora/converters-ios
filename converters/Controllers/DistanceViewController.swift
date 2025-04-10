//
//  DistanceViewController.swift
//  converters
//
//  Created by Rodrigo Amora on 23/06/23.
//

import Foundation
import UIKit

class DistanceViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var lbAskDistance: UILabel!
    @IBOutlet weak var inputDistance: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var btConvertDistance: UIButton!
    @IBOutlet weak var pickerDistance: UIPickerView!
    
    // MARK: - Atributes
    private lazy var viewModel: DistanceViewModel = DistanceViewModel(viewDelegate: self)
    private let dataArray = [String(localized: "kilometer_to_mile"), String(localized: "mile_to_kilometer")]
    
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
        self.btConvertDistance.setTitle(String(localized: "btn_convert_distance"), for: .normal)
        self.btConvertDistance.overrideUserInterfaceStyle = .light
        
        self.inputDistance.placeholder = String(localized: "type_distance")
        self.inputDistance.keyboardType = .numbersAndPunctuation
        self.inputDistance.overrideUserInterfaceStyle = .light
        
        self.pickerDistance.overrideUserInterfaceStyle = .light
        
        self.lbAskDistance.text = String(localized: "convert_distance")
        self.lbAskDistance.overrideUserInterfaceStyle = .light
        
        self.lbResult.text = ""
        self.lbResult.overrideUserInterfaceStyle = .light
    }
    
    private func configureDelegates() {
        self.pickerDistance.delegate = self
        self.pickerDistance.dataSource = self
        
        self.inputDistance.delegate = self
    }
    
    // MARK: - IBActions
    @IBAction func convertTemperature() {
        self.hideKeyboard()
        
        let distance = self.inputDistance.text?.replacingOccurrences(of: ",", with: ".") ?? ""
        if (distance.isEmpty) {
            self.showAlertController(title: "", message: String(localized: "distance_empty"))
            return
        }
        
        let distanceTyped = Double(distance)
        
        let index = self.pickerDistance.selectedRow(inComponent: 0)
        switch index {
            case 0:
                self.viewModel.kilometerToMile(distanceTyped ?? 0)
                break
            
            case 1:
                self.viewModel.mileToKilometer(distanceTyped ?? 0)
                break
            
            default:
                break
        }
    }
}

// MARK: - UIPickerViewDelegate
extension DistanceViewController: UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}

// MARK: - UIPickerViewDataSource
extension DistanceViewController: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.dataArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let row = self.dataArray[row]
        return row
    }
}


// MARK: - UITextFieldDelegate
extension DistanceViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let aSet = NSCharacterSet(charactersIn:"0123456789.,-").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        
        return string == numberFiltered
    }
}


// MARK: - ViewDelegate
extension DistanceViewController: ViewDelegate {
    func updateView(result: String) {
        self.lbResult.text = result
        AnimationsUtil.showIn(view: self.lbResult, duration: 3)
    }
}
