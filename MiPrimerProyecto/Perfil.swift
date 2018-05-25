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
    
    func agregarGasto(dbg:Double, nota:String)  {
        dbGastos = dbGastos + dbg
        let gas = Gasto()
        gas.sGasto = dbg
        gas.sNotaG = nota
        arGastos.append(gas)
    }
    
    func agregarIngreso(dbi:Double,nota:String)  {
        dbIngresos = dbIngresos + dbi
        let ing = Ingreso()
        ing.sIngreso = dbi
        ing.sNotaI = nota
        arIngresos.append(ing)
    }
    
    func setMap(valores:[String:Any]) {
        sNombre = valores[IDNombre] as? String
        sEmail = valores[IDEmail] as? String
        sImage = valores[IDImage] as? String
        dbIngresos = (valores[IDingreso] as? Double)!
        dbGastos = (valores[IDgastos] as? Double)!
        
        sID = DataHolder.sharedInstance.firUser?.uid
        let sRutaGastos:String = String(format: "Perfiles/%@/ListaGastos", sID!)
        
        DataHolder.sharedInstance.FireStoreDB?.collection(sRutaGastos).addSnapshotListener { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
               
            } else {
                self.arGastos=[]
                for document in querySnapshot!.documents {
                    let gasto:Gasto = Gasto(valores: document.data() as [String : AnyObject])
                    gasto.sID=document.documentID
                    self.arGastos.append(gasto)
                    print("\(document.documentID) => \(document.data())")
                }
                print("array gastos ---", self.arGastos.count)
            }
        }
        
        let sRutaIngresos:String = String(format: "Perfiles/%@/ListaIngresos", sID!)
        
        DataHolder.sharedInstance.FireStoreDB?.collection(sRutaIngresos).addSnapshotListener { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                
            } else {
                self.arIngresos=[]
                for document in querySnapshot!.documents {
                    let ingreso:Ingreso = Ingreso(valores: document.data() as [String : AnyObject])
                    ingreso.sID=document.documentID
                    self.arIngresos.append(ingreso)
                    print("\(document.documentID) => \(document.data())")
                }
                print("array ingresos --- ",self.arIngresos.count)
            }
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
