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
    
    override init() {
        super.init()
        sIngreso=0
        sNotaI=""
    }
    init(valores:[String:AnyObject]){
        sIngreso=valores["Ningreso"] as? Double
        sNotaI=valores["notaIng"] as? String
    }
    func getDiccionary() -> [String:AnyObject] {
        var hm:[String:AnyObject] = [:]
        hm["Ningreso"] = sIngreso! as AnyObject
        hm["notaIng"] = sNotaI! as AnyObject
        return hm
    }
}
