//
//  Gasto.swift
//  MiPrimerProyecto
//
//  Created by PABLO HERNANDEZ JIMENEZ on 16/5/18.
//  Copyright © 2018 PABLO HERNANDEZ JIMENEZ. All rights reserved.
//

import UIKit

class Gasto: NotaDinero {
    
    var sID:String?
    var sGasto:Double?
    var sNotaG:String?
    
    
    func datosIniciales() {
        super.iTipo = 0
        sGasto=0
        sNotaG=""
        print("?????????? ",iTipo)
    }
    
    
    override init() {
        super.init()
        self.datosIniciales()
    }
    
    init(valores:[String:AnyObject]){
        super.init()
        self.datosIniciales()
        sGasto=valores["Ngasto"] as? Double
        sNotaG=valores["notaGas"] as? String
        print("!!!!!!!!!!?????????? ",iTipo)
    }
    func getMap() -> [String:AnyObject] {
        var hm:[String:AnyObject] = [:]
        hm["Ngasto"] = sGasto! as AnyObject
        hm["notaGas"] = sNotaG! as AnyObject
        return hm
    }
    
    func guardarEnFB(sRuta:String) {
        sID = DataHolder.sharedInstance.firUser?.uid
        DataHolder.sharedInstance.FireStoreDB?.collection(sRuta).document((sID)!).setData(getMap())
    }
    
}
