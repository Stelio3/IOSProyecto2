//
//  Ingreso.swift
//  MiPrimerProyecto
//
//  Created by PABLO HERNANDEZ JIMENEZ on 16/5/18.
//  Copyright © 2018 PABLO HERNANDEZ JIMENEZ. All rights reserved.
//

import UIKit

class Ingreso: NSObject {

    var sIngreso:Double?
    var sNotaI:String?
    var sID:String?
    
    override init() {
        super.init()
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
        return hm
    }
    
    func guardarEnFB(sRuta:String) {
        DataHolder.sharedInstance.FireStoreDB?.collection(sRuta).document((sID)!).setData(getMap())
    }
}
