//
//  LogInVoluntarioViewController.swift
//  appCaritasMty
//
//  Created by Geraldine Torres on 18/09/22.
//

import UIKit
import CryptoKit

class LogInVoluntarioViewController: UIViewController {
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var lbEmailError: UILabel!
    @IBOutlet weak var lbPasswordError: UILabel!
    @IBOutlet weak var btnLogin: UIButton!
    
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
        
        resetForm()
        // Do any additional setup after loading the view.
    }
    
    func resetForm(){
        btnLogin.isEnabled = false
        
        lbEmailError.isHidden = false
        lbPasswordError.isHidden = false
        
        lbEmailError.text = ""
        lbPasswordError.text = ""
        
        tfEmail.text = ""
        tfPassword.text = ""
    }
    
    @IBAction func emailChanged(_ sender: Any) {
        if let email = tfEmail.text{
            if let errorMessage = invalidEmail(email){
                tfEmail.layer.borderColor = UIColor(red:255/255, green: 59/255,blue: 48/255, alpha: 1).cgColor
                lbEmailError.text = errorMessage
                lbEmailError.isHidden = false
            }
            else {
                tfEmail.layer.borderColor = UIColor(rgb: 0x0099A9).cgColor
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
        if let password = tfPassword.text{
            if containsDigit(password){
                lbPasswordError.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    func containsDigit(_ password: String) -> Bool{
        let passwordRegex = ".*[0-9]+.*"
        let predicate = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
        return !predicate.evaluate(with: password)
    }
    
    func checkForValidForm(){
        if lbEmailError.isHidden && lbPasswordError.isHidden{
            btnLogin.isEnabled = true
        }
        else{
            btnLogin.isEnabled = false
        }
    }
    
    @IBAction func login(_ sender: UIButton) {
        if API() == "invalid"{
            let alerta = UIAlertController(title: "Usuario inválido", message: "Verifica que tu correo y contraseña estén correctos.", preferredStyle: .alert);
                       let botonCancel = UIAlertAction(title: "Volver a intentar", style: .cancel, handler: nil)
                       alerta.addAction(botonCancel)
                       present(alerta, animated: true)
        }
        else if API() == "valid"{
            print("FUNCIONA")
            // Se va a mover a donde vamos a usar el id de voluntario y el nombre
            let idVol = defaults.integer(forKey: "idVol")
            let nombre = defaults.string(forKey: "nombreVol")
            print("ID: \(idVol)" )
            print("Nombre: \(nombre ?? "")" )
            // segue
        }
    }
    
    func hashing(password : String) -> String{
            let inputdata = Data(password.utf8)
            let hashed = SHA512.hash(data: inputdata)
            let hashPassword = hashed.compactMap { String(format: "%02x", $0) }.joined()
            return (hashPassword)
    }
    
    let defaults = UserDefaults.standard
    func API() -> String{
        var searchEmail = "dummy"
        var searchPassword = "dummy"
        var apiAnswer = ""
        
        if (tfEmail != nil && tfPassword.text != ""){
            searchEmail = tfEmail.text!
            searchPassword = hashing(password:  tfPassword.text!)
        }
        
        guard let url = URL(string: "https://equipo02.tc2007b.tec.mx:10210/vol?correo=\(searchEmail)&contrasenia=\(searchPassword)") else{
                return apiAnswer
            }
            
            let group = DispatchGroup()
            group.enter()
        
            let task = URLSession.shared.dataTask(with: url){
                data, response, error in
                
                
                let decoder = JSONDecoder()
                        if let data = data{
                            do{
                                let tasks = try decoder.decode([Voluntario].self, from: data)
                                if (!tasks.isEmpty){
                                    tasks.forEach{ i in
                                        print("-------- Voluntario ---------")
                                        print("Correo: \(i.correo)" )
                                        print("Contraseña: \(i.Contrasenia)" )
                                        // Agregar segue a la vista de voluntario
                                        apiAnswer = "valid"
                                        self.defaults.setValue(i.idVol, forKey: "idVol")
                                        self.defaults.setValue(i.nombre, forKey: "nombreVol")
                                    }
                                }else{
                                    // Ventana emergente usuario inválido
                                    apiAnswer = "invalid"
                                    print("----- USUARIO NO ENCONTRADO -----")
                                }
                            }catch{
                                print(error)
                            }
                        }
                group.leave()
            }
            task.resume()

        group.wait()
        return apiAnswer
    }

    
}
