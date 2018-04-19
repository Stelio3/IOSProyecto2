//
//  City.swift
//  MiPrimerProyecto
//
//  Created by Pablo Hernadez Jiménez on 15/4/18.
//  Copyright © 2018 PABLO HERNANDEZ JIMENEZ. All rights reserved.
//

import UIKit

class City: NSObject {
    let IDCAPITAL = "capital"
    let IDCOUNTRY = "country"
    let IDNAME = "name"
    let IDPOPULATION = "population"
    let IDSTATE = "state"
    let IDURLIMAGE = "url_image"
    let IDLongitud = "longitud"
    let IDLatitude = "latitud"

    var sID:String?
    var sCapital:String?
    var sCountry:String?
    var sName:String?
    var iPop:Int?
    var sState:String?
    var sUrlImage:String?
    var iLongitud:Double?
    var iLatitude:Double?
    
    func setMap(valores:[String:Any]) {
        sCapital = valores[IDCAPITAL] as? String
        sCountry = valores[IDCOUNTRY] as? String
        sName = valores[IDNAME] as? String
        iPop = valores[IDPOPULATION] as? Int
        sState = valores[IDSTATE] as? String
        sUrlImage = valores[IDURLIMAGE] as? String
        iLongitud = valores[IDLongitud] as? Double
        iLatitude = valores[IDLatitude] as? Double
        
        if sUrlImage == nil{
            sUrlImage = "gs://miprimerproyecto-9f885.appspot.com/descarga.jpg"
        }
    }
    
    func getMap() -> [String:Any]{
        return[
            IDCAPITAL: sCapital as Any,
            IDCOUNTRY: sCountry as Any,
            IDNAME: sName as Any,
            IDPOPULATION: iPop as Any,
            IDSTATE: sState as Any,
            IDURLIMAGE: sUrlImage as Any,
            IDLongitud: iLongitud as Any,
            IDLatitude: iLatitude as Any
        ]
    }
}
