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
        self.hideKeyBoardWhenTappedAround()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func DHDInsertarIngreso(blingreso: Bool) {
        if blingreso{
            self.performSegue(withIdentifier: "tringresar", sender: self)
        }else{
            let alerta = UIAlertController(title: "Aviso", message: "El campo azul no puede estar vacío para guardar el ingreso", preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title:"OK", style: .default, handler: nil))
            self.present(alerta, animated: true, completion: nil)
            
        }
    }
    @IBAction func GuardarIngreso() {
        let ing = Ingreso()
        DataHolder.sharedInstance.insertarIngreso(ing: Double((txtCantIngreso?.text)!)!, notaI: (txtANotaIngreso?.text)!, ingreso: ing, delegate: self)
        
    }
}
