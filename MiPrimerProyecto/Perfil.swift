//
//  Perfil.swift
//  MiPrimerProyecto
//
//  Created by PABLO HERNANDEZ JIMENEZ on 12/4/18.
//  Copyright © 2018 PABLO HERNANDEZ JIMENEZ. All rights reserved.
//

import UIKit

class Perfil: NSObject {

    var sNombre:String?
    var sApellido:String?
    var iFecha:Int?
    
    func setMap(valores:[String:Any]) {
        sNombre = valores["nombre"] as? String
        sApellido = valores["nombre"] as? String
        iFecha = valores["nombre"] as? Int
    }
    
    func getMap() -> [String:Any]{
        return[
            "nombre": sNombre as Any,
            "apellido":sApellido as Any,
            "nacimiento": iFecha as Any
        ]
    }
}
