//
//  LogInVoluntarioViewController.swift
//  appCaritasMty
//
//  Created by Geraldine Torres on 18/09/22.
//

import UIKit

class LogInVoluntarioViewController: UIViewController {
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfEmail.layer.cornerRadius = 5
        tfEmail.layer.masksToBounds = true
        tfEmail.layer.borderWidth = 1
        tfEmail.layer.borderColor = UIColor(rgb: 0x0099A9).cgColor
        tfEmail.backgroundColor = UIColor(rgb: 0x4397A7).withAlphaComponent(0.08)
        tfEmail.setLeftPaddingPoints(10)
        tfEmail.setRightPaddingPoints(10)
        tfPassword.layer.cornerRadius = 5
        tfPassword.layer.masksToBounds = true
        tfPassword.layer.borderWidth = 1
        tfPassword.layer.borderColor = UIColor(rgb: 0x0099A9).cgColor
        tfPassword.backgroundColor = UIColor(rgb: 0x4397A7).withAlphaComponent(0.08)
        tfPassword.setLeftPaddingPoints(10)
        tfPassword.setRightPaddingPoints(10)
        
        // Do any additional setup after loading the view.
    }

}
