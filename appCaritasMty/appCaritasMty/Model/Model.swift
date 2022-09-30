//
//  Model.swift
//  appCaritasMty
//
//  Created by CLP on 20/09/22.
//

import Foundation

struct Voluntario:Codable{
    let Contrasenia: String
    let correo: String
    let idVol: Int
    let nombre: String
}

struct Administrador:Codable{
    let Contrasenia: String
    let correo: String
}
