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
    var sID:String?
    
    override init() {
        super.init()
        iTipo = 1
        sIngreso=0
        sNotaI=""
    }
    init(valores:[String:AnyObject]){
        sIngreso=valores["Ningreso"] as? Double
        sNotaI=valores["notaIng"] as? String
    }
    func getMap() -> [String:AnyObject] {
        var hm:[String:AnyObject] = [:]
        hm["Ningreso"] = sIngreso! as AnyObject
        hm["notaIng"] = sNotaI! as AnyObject
        print(hm)
        return hm
    }
    
    func guardarEnFB(sRuta:String) {
        sID = "1"
        DataHolder.sharedInstance.FireStoreDB?.collection(sRuta).document((sID)!).setData(getMap())
    }
}
