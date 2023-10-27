//
//  AboutViewController.swift
//  converters
//
//  Created by Rodrigo Amora on 27/10/23.
//

import UIKit

class AboutViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var lbCreatedBy: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbEmail: UILabel!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initViews()
    }

    // MARK: - Methods
    private func initViews() {
        self.lbCreatedBy.text = String(localized: "created_by")
        self.lbName.text = String(localized: "created_by_name")
        self.lbEmail.text = String(localized: "created_by_email")
    }
}
