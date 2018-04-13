//
//  DataHolder.swift
//  MiPrimerProyecto
//
//  Created by PABLO HERNANDEZ JIMENEZ on 10/4/18.
//  Copyright © 2018 PABLO HERNANDEZ JIMENEZ. All rights reserved.
//

import UIKit
import Firebase

class DataHolder: NSObject {

    static let sharedInstance:DataHolder = DataHolder()
    
    var locationAdmin:LocationAdmin?
    var sNick:String = "Yony"
    var FireStoreDB:Firestore?
    var miPerfil:Perfil = Perfil()
    
    func initFireBase(){
        FirebaseApp.configure()
        FireStoreDB = Firestore.firestore()
    }
    
    func initLocationAdmin(){
        locationAdmin=LocationAdmin()
    }
    func nombreDeCelda(numero:Int) -> NSString {
        if(numero == 0){
            return "Pablo"
        }
        return ""
    }
}
