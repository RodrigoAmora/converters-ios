//
//  AboutViewController.swift
//  converters
//
//  Created by Rodrigo Amora on 27/10/23.
//

import UIKit

class AboutViewController: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var lbCreatedBy: UILabel!
    @IBOutlet weak var lbEmail: UILabel!
    @IBOutlet weak var lbVersion: UILabel!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initViews()
    }

    // MARK: - Methods
    private func initViews() {
        self.lbCreatedBy.text = String(localized: "created_by")
        self.lbEmail.text = String(localized: "created_by_email")
        self.lbVersion.text = self.getVersionAppString()
    }
    
    private func getVersionAppString() -> String {
        let version = self.getVersionApp() ?? ""
        return "\(String(localized: "created_by_version")) \(version)"
    }
}
