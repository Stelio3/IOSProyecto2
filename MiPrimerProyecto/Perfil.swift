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
    var sEmail:String?
    //var iFecha:Int?
    
    func setMap(valores:[String:Any]) {
        sNombre = valores[IDNombre] as? String
        sEmail = valores["email"] as? String
    }
    
    func getMap() -> [String:Any]{
        return[
            IDNombre: sNombre as Any,
            "email":sEmail as Any,
        ]
    }
}
