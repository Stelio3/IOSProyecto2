//
//  VCGastar.swift
//  MiPrimerProyecto
//
//  Created by PABLO HERNANDEZ JIMENEZ on 8/5/18.
//  Copyright © 2018 PABLO HERNANDEZ JIMENEZ. All rights reserved.
//

import UIKit

class VCGastar: UIViewController, DataHolderDelegate {
    
    @IBOutlet var txtCantGasto:NuevoTextField?
    @IBOutlet var txtANotaGasto:UITextView?
    @IBOutlet var btnGuardarGasto:UIButton?
    @IBOutlet var btnCancelarGasto:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnGuardarGasto?.layer.cornerRadius = 10
        btnCancelarGasto?.layer.cornerRadius = 10
        self.hideKeyBoardWhenTappedAround()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func GuardarGasto() {
        if (!(txtCantGasto?.text?.isEmpty)!) {
            DataHolder.sharedInstance.miPerfil.agregarGasto(dbg: Double((txtCantGasto?.text)!)!, nota: (txtANotaGasto?.text)!)
            DataHolder.sharedInstance.saveUser()
            self.performSegue(withIdentifier: "trgastar", sender: self)
        }
        else{
            let alerta = UIAlertController(title: "Aviso", message: "Introduzca una cantidad a gastar", preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title:"OK", style: .default, handler: nil))
            self.present(alerta, animated: true, completion: nil)
        }
    }

}
