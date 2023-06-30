//
//  DistanceViewController.swift
//  converters
//
//  Created by Rodrigo Amora on 23/06/23.
//

import Foundation
import UIKit

class DistanceViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
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
        btConvertDistance.titleLabel?.text = "OK"
        
        inputDistance.placeholder = String(localized: "type_distance")
        lbAskDistance.text = String(localized: "convert_distance")
        lbResult.text = ""
        
        pickerDistance.delegate = self as UIPickerViewDelegate
        pickerDistance.dataSource = self as UIPickerViewDataSource
    }
    
    private func configureRightBarButtonItem() {
        let temperature = UIAction(title: String(localized: "menu_convert_temperatue"), image: UIImage(systemName: "person.circle")) { _ in
            self.changeViewController(0)
        }
        
        let distance = UIAction(title: String(localized: "menu_convert_distance"), image: UIImage(systemName: "rectangle.portrait.and.arrow.right")) { _ in
            self.changeViewController(1)
        }
        
        btRightMenu.image = UIImage(systemName: "text.justify")
        btRightMenu.menu = UIMenu(title: "", children: [temperature, distance])
        
        navBar.topItem?.title = String(localized: "app_name")
        navBar.backgroundColor = UIColor.blue
    }
    
    private func changeViewController(_ selectedIndex: Int) {
//        self.navigationController?.pushViewController(viewController, animated: true)
        tabBarController?.selectedIndex = selectedIndex
    }
    
    // MARK: - IBActions
    @IBAction func convertTemperature() {
        let distanceTyped = Double(inputDistance.text ?? "0")
        var distanceConverted: Double = 0;
        
        let a = pickerDistance.selectedRow(inComponent: 0)
        switch a {
            case 0:
                distanceConverted = DistanceService.kilometerToMile(distanceTyped ?? 0)
                break
            
            case 1:
                distanceConverted = DistanceService.mileToKilometer(distanceTyped ?? 0)
                break
            
            default:
                break
        }
        
        lbResult.text = String(distanceConverted)
    }
    
}
