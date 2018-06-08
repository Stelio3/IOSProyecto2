//
//  VCIngresar.swift
//  MiPrimerProyecto
//
//  Created by Pablo Hernadez Jiménez on 29/4/18.
//  Copyright © 2018 PABLO HERNANDEZ JIMENEZ. All rights reserved.
//

import UIKit

class VCIngresar: UIViewController, DataHolderDelegate {

    
    @IBOutlet var txtCantIngreso:NuevoTextField?
    @IBOutlet var txtANotaIngreso:NuevoTextField?
    @IBOutlet var btnGuardarIngreso:UIButton?
    @IBOutlet var btnCancelarIngreso:UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        btnGuardarIngreso?.layer.cornerRadius = 10
        btnCancelarIngreso?.layer.cornerRadius = 10
        self.hideKeyBoardWhenTappedAround()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func GuardarIngreso() {
        if (!(txtCantIngreso?.text?.isEmpty)!){
            /*DataHolder.sharedInstance.miIngreso.sIngreso = Double((txtCantIngreso?.text)!)!
            DataHolder.sharedInstance.miIngreso.sNotaI = txtANotaIngreso?.text
            DataHolder.sharedInstance.insertarIngreso(ing: Double((txtCantIngreso?.text)!)!, notaI: (txtANotaIngreso?.text)!, delegate: self)*/
            DataHolder.sharedInstance.miPerfil.agregarIngreso(dbi: Double((txtCantIngreso?.text)!)!, nota: (txtANotaIngreso?.text)!)
            DataHolder.sharedInstance.saveUser()
            self.performSegue(withIdentifier: "tringresar", sender: self)
        }
        else{
            let alerta = UIAlertController(title: "Aviso", message: "Introduzca una cantidad a ingresar", preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title:"OK", style: .default, handler: nil))
            self.present(alerta, animated: true, completion: nil)
        }
        
    }
}
