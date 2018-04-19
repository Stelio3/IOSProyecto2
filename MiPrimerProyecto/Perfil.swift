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
    let IDEmail="email"
    let IDImage="url_image"
    
    var sID:String?
    var sNombre:String?
    var sEmail:String?
    var sImage:String?
    //var iFecha:Int?
    
    func setMap(valores:[String:Any]) {
        sNombre = valores[IDNombre] as? String
        sEmail = valores[IDEmail] as? String
        sImage = valores[IDImage] as? String
        
        if sImage == nil{
            sImage = "gs://miprimerproyecto-9f885.appspot.com/rafa.jpg"
        }
    }
    
    func getMap() -> [String:Any]{
        return[
            IDNombre: sNombre as Any,
            IDEmail:sEmail as Any,
            IDImage:sImage as Any
        ]
    }
}
