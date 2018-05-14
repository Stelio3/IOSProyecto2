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
    var firStorage:Storage?
    var fireStorageRef:StorageReference?
    var miPerfil:Perfil = Perfil()
    var arCiudades:[City] = []
    var arPerfiles:[Perfil] = []
    var hmImagenesDescargadas:[String:UIImage]?=[:]
    var user:String?
    var pass:String?
    //var firUser:User?
    
    
    func initFireBase(){
        FirebaseApp.configure()
        FireStoreDB = Firestore.firestore()
        firStorage = Storage.storage()
        fireStorageRef = firStorage?.reference()
        /*let citiesRef = FireStoreDB?.collection("cities")
        
        citiesRef?.document("SF").setData([
            "name": "San Francisco",
            "state": "CA",
            "country": "USA",
            "capital": false,
            "population": 860000
            ])
        citiesRef?.document("LA").setData([
            "name": "Los Angeles",
            "state": "CA",
            "country": "USA",
            "capital": false,
            "population": 3900000
            ])
        citiesRef?.document("DC").setData([
            "name": "Washington D.C.",
            "country": "USA",
            "capital": true,
            "population": 680000
            ])
        citiesRef?.document("TOK").setData([
            "name": "Tokyo",
            "country": "Japan",
            "capital": true,
            "population": 9000000
            ])
        citiesRef?.document("BJ").setData([
            "name": "Beijing",
            "country": "China",
            "capital": true,
            "population": 21500000
            ])*/
 
    }
    
    func initLocationAdmin(){
        locationAdmin=LocationAdmin()
    }
    func loadData() {
        let props = UserDefaults.standard
        user = props.string(forKey: "User_login")
        pass = props.string(forKey: "Password_login")
    }
    
    func saveData() {
        let props = UserDefaults.standard
        props.setValue(user, forKey: "User_login")
        props.setValue(pass, forKey: "Password_login")
        props.synchronize()
    }
    func getImage(clave:String, getDelegate delegate:DataHolderDelegate){
        if self.hmImagenesDescargadas?[clave] == nil{
            let gsReference = self.firStorage?.reference(forURL: clave)
            
            // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
            gsReference?.getData(maxSize: 1 * 1024 * 1024) { data, error in
                if error != nil{
                    // Uh-oh, an error occurred!
                } else {
                    // Data for "images/island.jpg" is returned
                    let image = UIImage(data: data!)
                    self.hmImagenesDescargadas?[clave] = image
                    delegate.DHDImagenDescargada!(imagen: image!)
                }
            }
            // }
        }
        else{
            delegate.DHDImagenDescargada!(imagen: (self.hmImagenesDescargadas?[clave])!)
            
        }
        
    }
    func setDownloadedImage(clave:String, imagenDes image:UIImage) {
        hmImagenesDescargadas![clave]=image
    }
    func nombreDeCelda(numero:Int) -> NSString {
        if(numero == 0){
            return "Pablo"
        }
        return ""
    }
    func descargarCiudades(delegate:DataHolderDelegate){
        FireStoreDB?.collection("cities")
            .addSnapshotListener { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                    delegate.DHDDescargaCiudadesCompleta!(blFinCiudades: false)
                } else {
                    self.arCiudades=[]
                    for document in querySnapshot!.documents {
                        let ciudad:City = City()
                        ciudad.sID=document.documentID
                        ciudad.setMap(valores: document.data())
                        self.arCiudades.append(ciudad)
                        
                        print("\(document.documentID) => \(document.data())")
                    }
                    print(self.arCiudades.count)
                    delegate.DHDDescargaCiudadesCompleta!(blFinCiudades: true)
                    //self.refreshUI()
                    
                    
                }
        }
    }
    func descargarPerfiles(delegate: DataHolderDelegate){
        self.FireStoreDB?.collection("Perfiles")
            .addSnapshotListener { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                    delegate.DHDDescargaPerfilesCompleta!(blFinPerfiles: false)
                } else {
                    self.arPerfiles=[]
                    for document in querySnapshot!.documents {
                        let perfil:Perfil = Perfil()
                        perfil.sID=document.documentID
                        perfil.setMap(valores: document.data())
                        self.arPerfiles.append(perfil)
                        
                        print("\(document.documentID) => \(document.data())")
                    }
                    print(self.arPerfiles.count)
                    //self.refreshUI()
                    delegate.DHDDescargaPerfilesCompleta!(blFinPerfiles: true)
                }
                // Do any additional setup after loading the view.
        }
        
    }
    func eventoClickLoginDH(email:String, pass:String, delegate: DataHolderDelegate){
        Auth.auth().signIn(withEmail: (email), password: (pass)) { (user, error) in
            if user != nil{
                let ruta = self.FireStoreDB?.collection("Perfiles").document((user?.uid)!)
                ruta?.getDocument { (document, error) in
                    if document != nil{
                        self.miPerfil.setMap(valores: (document?.data())!)
                        delegate.DHDLoginOk!(blLogin: true)
                        
                    }else{
                        print(error!)
                        delegate.DHDLoginOk!(blLogin: false)
                    }
                }
            }
            else{
                print("NO SE HA LOGUEADO!")
                print(error!)
            }
        }
    }
    func clickRegistrarDH(emailR:String, passR:String, repassR:String, name:String, delegate: DataHolderDelegate){
        Auth.auth().createUser(withEmail: (emailR), password: (passR)) { (User, error) in
            if (User != nil) && (passR == repassR){
                print("Te registraste")
                self.FireStoreDB?.collection("Perfiles").document((User?.uid)!).setData(self.miPerfil.getMap())
                delegate.DHDRegisterOk!(blRegister: true)
            }else{
                print(error!)
                delegate.DHDRegisterOk!(blRegister: false)
            }
        }
        print("HOLA!!" )
    }
    /*func borrarCuenta(delegate:DataHolderDelegate){
        let user = self.firUser
        
        user?.delete { error in
            if let error = error {
                // An error happened.
            } else {
                // Account deleted.
                self.FireStoreDB?.collection("Perfiles").document((user?.uid)!).delete() { err in
                    if let err = err {
                        print("Error removing document: \(err)")
                    } else {
                        print("Document successfully removed!")
                        delegate.DHDBorrar!(blfin: true)
                        //self.performSegue(withIdentifier: "borrarcuenta", sender: self)
                    }
                }
                print("cuenta borrada")
                
            }
        }
    }*/
    /*func saveUser() {
        self.FireStoreDB?.collection("Perfiles").document((firUser?.uid)!).setData(DataHolder.sharedInstance.miPerfil.getMap())
    }*/
}

extension UIViewController{
    func hideKeyBoardWhenTappedAround() {
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

@objc protocol DataHolderDelegate{
    @objc optional func DHDDescargaCiudadesCompleta(blFinCiudades:Bool)
    @objc optional func DHDDescargaPerfilesCompleta(blFinPerfiles:Bool)
    @objc optional func DHDLoginOk(blLogin:Bool)
    @objc optional func DHDRegisterOk(blRegister:Bool)
    @objc optional func DHDImagenDescargada(imagen:UIImage)
    @objc optional func DHDBorrar(blfin:Bool)
}
