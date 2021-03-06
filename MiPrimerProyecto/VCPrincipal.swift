//
//  VCPrincipal.swift
//  MiPrimerProyecto
//
//  Created by PABLO HERNANDEZ JIMENEZ on 24/4/18.
//  Copyright © 2018 PABLO HERNANDEZ JIMENEZ. All rights reserved.
//

import UIKit
import GTProgressBar
import FirebaseAuth

class VCPrincipal: UIViewController, DataHolderDelegate{
    
    @IBOutlet var ProgressBar:GTProgressBar?
    @IBOutlet var btnIngreso:UIButton?
    @IBOutlet var btnGasto:UIButton?
    @IBOutlet var btnBorrarCuenta:UIButton?
    @IBOutlet var btnCerrarSesion:UIButton?
    @IBOutlet var VistaMenu:UIView?
    @IBOutlet var btndesplegarMenu:UIButton?
    var frmMenuAppear:CGRect?
    var frmMenuCerrar:CGRect?

    override func viewDidLoad() {
        super.viewDidLoad()
        btnIngreso?.layer.cornerRadius = 15
        btnGasto?.layer.cornerRadius = 15
        btndesplegarMenu?.layer.cornerRadius = 15
        btnBorrarCuenta?.layer.cornerRadius = 10
        btnCerrarSesion?.layer.cornerRadius = 10
        
        frmMenuCerrar = VistaMenu?.frame
        frmMenuAppear = VistaMenu?.frame
        frmMenuAppear?.origin.x = 0
        
        print(" ------------ ",DataHolder.sharedInstance.miPerfil.dbIngresos)
        print(" ------------ ",DataHolder.sharedInstance.miPerfil.dbGastos)
        if(DataHolder.sharedInstance.miPerfil.dbIngresos != 0 || DataHolder.sharedInstance.miPerfil.dbGastos != 0){
            ProgressBar?.progress = CGFloat(DataHolder.sharedInstance.miPerfil.dbIngresos / (DataHolder.sharedInstance.miPerfil.dbIngresos + DataHolder.sharedInstance.miPerfil.dbGastos))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func accionSalir(){
        do{
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "trCerrarSesion", sender: self)
        }
        catch let err {
            print(err)
        }
    }
    
    @IBAction func AbrirMenu(){
        UIView.animate(withDuration: 0.8, delay: 0.1, options:  UIViewAnimationOptions.curveEaseIn, animations:{ () -> Void in
            
            self.VistaMenu?.frame = self.frmMenuAppear!
        }, completion: {(finished)-> Void in})
    }
    @IBAction func CerrarMenu(){
        UIView.animate(withDuration: 0.8, delay: 0.1, options:  UIViewAnimationOptions.curveEaseIn, animations:{ () -> Void in
            
            self.VistaMenu?.frame = self.frmMenuCerrar!
        }, completion: {(finished)-> Void in})
    }
    func DHDBorrar(blfin: Bool) {
        if blfin{
            self.performSegue(withIdentifier: "borrarcuenta", sender: self)
        }
    }
    @IBAction func accionBorrar(){
        DataHolder.sharedInstance.borrarCuenta(delegate: self)
    }
}
