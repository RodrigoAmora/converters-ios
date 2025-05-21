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
        self.btConvertDistance.accessibilityIdentifier = "btConvert"
        self.btConvertDistance.setTitle(String(localized: "btn_convert_distance"), for: .normal)
        
        self.inputDistance.accessibilityIdentifier = "inputDistance"
        self.inputDistance.placeholder = String(localized: "type_distance")
        self.inputDistance.keyboardType = .numbersAndPunctuation
        self.inputDistance.autocorrectionType = .no
        
        self.lbAskDistance.text = String(localized: "convert_distance")
        
        self.lbResult.accessibilityIdentifier = "lbDistanceConverted"
        self.lbResult.text = ""
    }
    
    private func configureDelegates() {
        self.pickerDistance.delegate = self
        self.pickerDistance.dataSource = self
        
        self.inputDistance.delegate = self
    }
    
    // MARK: - IBActions
    @IBAction func convertDistance() {
        self.hideKeyboard()
        
        let distanceTyped = self.inputDistance.text?.replacingOccurrences(of: ",", with: ".") ?? ""
        if (distanceTyped.isEmpty) {
            self.showAlert(title: "", message: String(localized: "distance_empty"))
            return
        }
        
        let distance = Double(distanceTyped)
        
        let index = self.pickerDistance.selectedRow(inComponent: 0)
        switch index {
            case 0:
                self.viewModel.kilometerToMile(distance ?? 0)
                break
            
            case 1:
                self.viewModel.mileToKilometer(distance ?? 0)
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
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}


// MARK: - ViewDelegate
extension DistanceViewController: ViewDelegate {
    func updateView(result: String) {
        self.lbResult.text = result
        AnimationsUtil.flipFromBottom(view: self.lbResult, duration: 3)
    }
}
