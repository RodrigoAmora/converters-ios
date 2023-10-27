//
//  DistanceViewController.swift
//  converters
//
//  Created by Rodrigo Amora on 23/06/23.
//

import Foundation
import UIKit

class DistanceViewController: BaseViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - IBOutlets
    @IBOutlet weak var btRightMenu: UIBarButtonItem!
    @IBOutlet weak var lbAskDistance: UILabel!
    @IBOutlet weak var inputDistance: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var btConvertDistance: UIButton!
    @IBOutlet weak var pickerDistance: UIPickerView!
    @IBOutlet weak var navBar: UINavigationBar!
    
    // MARK: - Atributes
    let dataArray = [String(localized: "kilometer_to_mile"), String(localized: "mile_to_kilometer")]
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initViews()
        self.configureDelegates()
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
        self.btConvertDistance.setTitle(String(localized: "btn_convert_distance"), for: .normal)
        self.btConvertDistance.overrideUserInterfaceStyle = .light
        
        self.inputDistance.placeholder = String(localized: "type_distance")
        self.inputDistance.keyboardType = .numbersAndPunctuation
        self.inputDistance.overrideUserInterfaceStyle = .light
        
        self.lbAskDistance.text = String(localized: "convert_distance")
        self.lbAskDistance.overrideUserInterfaceStyle = .light
        
        self.lbResult.text = ""
        self.lbResult.overrideUserInterfaceStyle = .light
    }
    
    private func configureDelegates () {
        self.pickerDistance.delegate = self as UIPickerViewDelegate
        self.pickerDistance.dataSource = self as UIPickerViewDataSource
    }
    
    private func configureRightBarButtonItem() {
        let temperature = UIAction(title: String(localized: "menu_convert_temperatue"), image: UIImage(named: "ic_temperature")) { _ in
            self.changeTab(0)
        }
        
        let distance = UIAction(title: String(localized: "menu_convert_distance"), image: UIImage(named: "ic_distance")) { _ in
            self.changeTab(1)
        }
        
        btRightMenu.image = UIImage(systemName: "text.justify")
        btRightMenu.menu = UIMenu(title: "", children: [temperature, distance])
        
        navBar.topItem?.title = String(localized: "app_name")
        navBar.backgroundColor = UIColor.blue
    }
    
    // MARK: - IBActions
    @IBAction func convertTemperature() {
        let distance = inputDistance.text ?? ""
        if (distance.isEmpty) {
            showAlertController(title: "", message: String(localized: "distance_empty"))
            return
        }
        
        let distanceTyped = Double(distance)
        var distanceConverted: String = ""
        
        let index = pickerDistance.selectedRow(inComponent: 0)
        switch index {
            case 0:
                distanceConverted = DistanceService.kilometerToMile(distanceTyped ?? 0)
                break
            
            case 1:
                distanceConverted = DistanceService.mileToKilometer(distanceTyped ?? 0)
                break
            
            default:
                break
        }
        
        lbResult.text = distanceConverted
    }
    
}
