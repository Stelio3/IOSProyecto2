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
    let IDingreso="tIngresos"
    let IDgastos="tGastos"
    
    var sID:String?
    var sNombre:String?
    var sEmail:String?
    var sImage:String?
    var dbGastos:Double = 0.0
    var dbIngresos:Double = 0.0
    
    
    var arGastos:[Gasto] = []
    var arIngresos:[Ingreso] = []
    
    func agregarGasto(dbg:Double)  {
        dbGastos = dbGastos + dbg
        arGastos.append(Gasto())
    }
    
    func agregarIngreso(dbi:Double)  {
        dbIngresos = dbIngresos + dbi
        arIngresos.append(Ingreso())
    }
    
    func setMap(valores:[String:Any]) {
        print(getMap())
        sNombre = valores[IDNombre] as? String
        sEmail = valores[IDEmail] as? String
        sImage = valores[IDImage] as? String
        dbIngresos = (valores[IDingreso] as? Double)!
        dbGastos = (valores[IDgastos] as? Double)!
        
        /*for gastos in valores["ListaGastos"]as Any{
            
        }*/
        for ingresos in arIngresos{
        }
        
        if sImage == nil{
            sImage = "gs://miprimerproyecto-9f885.appspot.com/rafa.jpg"
        }
    }
    
    func getMap() -> [String:Any]{
        return[
            IDNombre: sNombre as Any,
            IDEmail:sEmail as Any,
            IDImage:sImage as Any,
            IDingreso:dbIngresos as Any,
            IDgastos:dbGastos as Any
        ]
    }
    
    func guardarEnFB(sRuta:String) {
        sID = DataHolder.sharedInstance.firUser?.uid
        DataHolder.sharedInstance.FireStoreDB?.collection(sRuta).document((sID)!).setData(getMap())
        
        let sRutaGastos:String = String(format: "Perfiles/%@/ListaGastos", sID!)
        for gasto in arGastos{
            gasto.guardarEnFB(sRuta: sRutaGastos)
        }
        let sRutaIngresos:String = String(format: "Perfiles/%@/ListaIngresos", sID!)
        for ingreso in arIngresos{
            ingreso.guardarEnFB(sRuta: sRutaIngresos)
        }
        
        
    }
}
