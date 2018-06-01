//
//  Ingreso.swift
//  MiPrimerProyecto
//
//  Created by PABLO HERNANDEZ JIMENEZ on 16/5/18.
//  Copyright © 2018 PABLO HERNANDEZ JIMENEZ. All rights reserved.
//

import UIKit

class Ingreso: NotaDinero {

    var sIngreso:Double?
    var sNotaI:String?
    var urlImage:String?
    var sID:String?
    
    func datosIniciales() {
        super.iTipo = 1
        sIngreso=0
        urlImage=""
        sNotaI=""
        print("?????????? ",iTipo)
    }
    
    override init() {
        super.init()
        self.datosIniciales()
    }
    init(valores:[String:AnyObject]){
        super.init()
        self.datosIniciales()
        sIngreso=valores["Ningreso"] as? Double
        sNotaI=valores["notaIng"] as? String
        urlImage=valores["ImagenI"] as? String
        if urlImage == nil{
            urlImage = "gs://miprimerproyecto-9f885.appspot.com/descarga.jpg"
        }
         print("!!!!!!!!!!?????????? ",iTipo)
        
    }
    func getMap() -> [String:AnyObject] {
        var hm:[String:AnyObject] = [:]
        hm["Ningreso"] = sIngreso! as AnyObject
        hm["notaIng"] = sNotaI! as AnyObject
        hm["ImagenI"] = urlImage! as AnyObject
        print(hm)
        return hm
    }
    
    func guardarEnFB(sRuta:String) {
        sID = "1"
        DataHolder.sharedInstance.FireStoreDB?.collection(sRuta).document((sID)!).setData(getMap())
    }
}
