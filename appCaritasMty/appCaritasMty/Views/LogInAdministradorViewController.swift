//
//  LogInAdministradorViewController.swift
//  appCaritasMty
//
//  Created by Geraldine Torres on 19/09/22.
//

import UIKit
import CryptoKit

class LogInAdministradorViewController: UIViewController {
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func login(_ sender: UIButton) {
        callAPI()
    }
    
    func hashing(password : String) -> String{
            let inputdata = Data(password.utf8)
            let hashed = SHA512.hash(data: inputdata)
            let hashPassword = hashed.compactMap { String(format: "%02x", $0) }.joined()
            return (hashPassword)
    }
    
    func callAPI(){
        var searchEmail = "dummy"
        var searchPassword = "dummy"
        
        if (tfEmail != nil && tfPassword.text != ""){
            searchEmail = tfEmail.text!
            searchPassword = hashing(password:  tfPassword.text!)
        }
        
        guard let url = URL(string: "https://equipo02.tc2007b.tec.mx:10210/admin?correo=\(searchEmail)&contrasenia=\(searchPassword)") else{
                return
            }
        
            let group = DispatchGroup()
            group.enter()
        
            let task = URLSession.shared.dataTask(with: url){
                data, response, error in
                
                
                let decoder = JSONDecoder()
                        if let data = data{
                            do{
                                let tasks = try decoder.decode([Administrador].self, from: data)
                                if (!tasks.isEmpty){
                                    tasks.forEach{ i in
                                        print("-------- Administrador ---------")
                                        print("Correo: \(i.correo)" )
                                        print("Contraseña: \(i.Contrasenia)" )
                                        // Agregar segue a la vista de voluntario
                                    }
                                }else{
                                    // Ventana emergente usuario inválido
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
    }

}
