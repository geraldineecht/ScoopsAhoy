//
//  RegistroVoluntarioViewController.swift
//  appCaritasMty
//
//  Created by Eduardo Jair Hernández Gómez on 07/09/22.
//

import UIKit
import CryptoKit

class RegistroVoluntarioViewController: UIViewController {

    @IBOutlet weak var etEmail: UITextField!
    @IBOutlet weak var etPassword: UITextField!
    @IBOutlet weak var etName: UITextField!
    @IBOutlet weak var etSecName: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        etName.layer.cornerRadius = 5
        etName.layer.masksToBounds = true
        etName.layer.borderWidth = 1
        etName.layer.borderColor = UIColor(rgb: 0x0099A9).cgColor
        etName.backgroundColor = UIColor(rgb: 0x4397A7).withAlphaComponent(0.08)
        etName.setLeftPaddingPoints(10)
        etName.setRightPaddingPoints(10)
        etSecName.layer.cornerRadius = 5
        etSecName.layer.masksToBounds = true
        etSecName.layer.borderWidth = 1
        etSecName.layer.borderColor = UIColor(rgb: 0x0099A9).cgColor
        etSecName.backgroundColor = UIColor(rgb: 0x4397A7).withAlphaComponent(0.08)
        etSecName.setLeftPaddingPoints(10)
        etSecName.setRightPaddingPoints(10)
        etEmail.layer.cornerRadius = 5
        etEmail.layer.masksToBounds = true
        etEmail.layer.borderWidth = 1
        etEmail.layer.borderColor = UIColor(rgb: 0x0099A9).cgColor
        etEmail.backgroundColor = UIColor(rgb: 0x4397A7).withAlphaComponent(0.08)
        etEmail.setLeftPaddingPoints(10)
        etEmail.setRightPaddingPoints(10)
        etPassword.layer.cornerRadius = 5
        etPassword.layer.masksToBounds = true
        etPassword.layer.borderWidth = 1
        etPassword.layer.borderColor = UIColor(rgb: 0x0099A9).cgColor
        etPassword.backgroundColor = UIColor(rgb: 0x4397A7).withAlphaComponent(0.08)
        etPassword.setLeftPaddingPoints(10)
        etPassword.setRightPaddingPoints(10)
        
        //print(hashing(password: t))
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnRegister(_ sender: UIButton) {
        let pass = hashing(password: etPassword.text!)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


func hashing(password : String) -> String{
        let inputdata = Data(password.utf8)
        let hashed = SHA512.hash(data: inputdata)
        let hashPassword = hashed.compactMap { String(format: "%02x", $0) }.joined()
        return (hashPassword)
}



extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
