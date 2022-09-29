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
    @IBOutlet weak var lbEmailError: UILabel!
    @IBOutlet weak var lbPasswordError: UILabel!
    @IBOutlet weak var btnRegistrarse: UIButton!
    @IBOutlet weak var lbNameRequired: UILabel!
    @IBOutlet weak var lbLastNameRequired: UILabel!
    
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
        
        resetForm()
        
        // Do any additional setup after loading the view.
    }
    
    func resetForm(){
        btnRegistrarse.isEnabled = false
        
        lbEmailError.isHidden = false
        lbPasswordError.isHidden = false
        
        lbEmailError.text = ""
        lbPasswordError.text = ""
        lbNameRequired.text = ""
        lbLastNameRequired.text = ""
        
        etEmail.text = ""
        etPassword.text = ""
    }
    
    @IBAction func emailChanged(_ sender: Any) {
        if let email = etEmail.text{
            if let errorMessage = invalidEmail(email){
                etEmail.layer.borderColor = UIColor(red:255/255, green: 59/255,blue: 48/255, alpha: 1).cgColor
                lbEmailError.text = errorMessage
                lbEmailError.isHidden = false
            }
            else {
                etEmail.layer.borderColor = UIColor(rgb: 0x0099A9).cgColor
                lbEmailError.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    func invalidEmail(_ email: String) -> String?{
        let firstpart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
        let serverpart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
        let emailRegex = firstpart + "@" + serverpart + "[A-Za-z]{2,8}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        if predicate.evaluate(with: email) == false{
            return "Correo inválido. Por favor, ingresa un correo válido."
        }
        return nil
    }
    
    @IBAction func passwordChanged(_ sender: Any) {
        if let password = etPassword.text{
            if let errorMessage = invalidPassword(password){
                etPassword.layer.borderColor = UIColor(red:255/255, green: 59/255,blue: 48/255, alpha: 1).cgColor
                lbPasswordError.text = errorMessage
                lbPasswordError.isHidden = false
            }
            else {
                etPassword.layer.borderColor = UIColor(rgb: 0x0099A9).cgColor
                lbPasswordError.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    func invalidPassword(_ password: String) -> String?{
        if password.count < 8{
            return "La longitud mínima es de 8 caracteres."
        }
        if containsDigit(password){
            return nil
        }
        return nil
    }
    
    func containsDigit(_ value: String) -> Bool{
        let Regex = ".*[0-9]+.*"
        let predicate = NSPredicate(format:"SELF MATCHES %@", Regex)
        return !predicate.evaluate(with: value)
    }
    
    func containsLetters(_ value: String) -> Bool{
        let Regex = ".*[a-z]+.*"
        let predicate = NSPredicate(format:"SELF MATCHES %@", Regex)
        return !predicate.evaluate(with: value)
    }

    func checkForValidForm(){
        if lbEmailError.isHidden && lbPasswordError.isHidden && lbNameRequired.isHidden && lbLastNameRequired.isHidden{
            btnRegistrarse.isEnabled = true
        }
        else{
            btnRegistrarse.isEnabled = false
        }
    }
    
    @IBAction func nameChanged(_ sender: Any) {
        if let name = etName.text{
            if containsDigit(name){
                lbNameRequired.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    @IBAction func lastNameChanged(_ sender: Any) {
        if let lastName = etSecName.text{
            if containsDigit(lastName){
                lbLastNameRequired.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    @IBAction func btnRegister(_ sender: UIButton) {
        API()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func hashing(password : String) -> String{
            let inputdata = Data(password.utf8)
            let hashed = SHA512.hash(data: inputdata)
            let hashPassword = hashed.compactMap { String(format: "%02x", $0) }.joined()
            return (hashPassword)
    }
    
    func API(){
        let email = etEmail.text
        let nombre = etName.text
        let apellido = etSecName.text
        let pass = hashing(password: etPassword.text!)
        
        guard let url = URL(string: "https://equipo02.tc2007b.tec.mx:10210/vol/registro") else{
                return
            }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let parameters: [String: AnyHashable] = [
            "Nombre": nombre,
            "Apellido": apellido,
            "Correo": email,
            "Contrasenia": pass
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .fragmentsAllowed)
        
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do {
let response =  try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print("No murio:  \(response)")
            }
            catch{
                print(error)
            }
        }
        task.resume()
    }
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

