//
//  Gasto.swift
//  MiPrimerProyecto
//
//  Created by PABLO HERNANDEZ JIMENEZ on 16/5/18.
//  Copyright © 2018 PABLO HERNANDEZ JIMENEZ. All rights reserved.
//

import UIKit

class Gasto: NSObject {
    var sGasto:Double?
    var sNotaG:String?
    
    override init() {
        super.init()
        sGasto=0
        sNotaG=""
    }
    init(valores:[String:AnyObject]){
        sGasto=valores["Ngasto"] as? Double
        sNotaG=valores["notaGas"] as? String
    }
    func getDiccionary() -> [String:AnyObject] {
        var hm:[String:AnyObject] = [:]
        hm["Ngasto"] = sGasto! as AnyObject
        hm["notaGas"] = sNotaG! as AnyObject
        return hm
    }
    
}
