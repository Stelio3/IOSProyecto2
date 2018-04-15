//
//  Perfil.swift
//  MiPrimerProyecto
//
//  Created by PABLO HERNANDEZ JIMENEZ on 12/4/18.
//  Copyright © 2018 PABLO HERNANDEZ JIMENEZ. All rights reserved.
//

import UIKit

class Perfil: NSObject {

    let IDNombre="nombre"
    var sID:String?
    var sNombre:String?
    var sApellido:String?
    var iFecha:Int?
    
    func setMap(valores:[String:Any]) {
        sNombre = valores[IDNombre] as? String
        sApellido = valores["apellido"] as? String
        iFecha = valores["nacimiento"] as? Int
    }
    
    func getMap() -> [String:Any]{
        return[
            IDNombre: sNombre as Any,
            "apellido":sApellido as Any,
            "nacimiento": iFecha as Any
        ]
    }
}
