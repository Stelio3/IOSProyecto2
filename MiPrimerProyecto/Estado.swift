//
//  Estado.swift
//  MiPrimerProyecto
//
//  Created by PABLO HERNANDEZ JIMENEZ on 16/5/18.
//  Copyright © 2018 PABLO HERNANDEZ JIMENEZ. All rights reserved.
//

import UIKit

class Estado: NSObject {

    let IDingreso="ingresos"
    let IDgasto="gastos"
    
    
    var sID:String?
    var sIngreso:String?
    var sGasto:String?
    
    //var iFecha:Int?
    
    func setMap(valores:[String:Any]) {
        sIngreso = valores[IDingreso] as? String
        sGasto = valores[IDgasto] as? String
    }
    
    func getMap() -> [String:Any]{
        return[
            IDingreso: sIngreso as Any,
            IDgasto: sGasto as Any,
        ]
    }
}
