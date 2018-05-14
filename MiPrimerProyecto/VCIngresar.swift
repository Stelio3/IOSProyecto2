//
//  VCIngresar.swift
//  MiPrimerProyecto
//
//  Created by Pablo Hernadez Jiménez on 29/4/18.
//  Copyright © 2018 PABLO HERNANDEZ JIMENEZ. All rights reserved.
//

import UIKit

class VCIngresar: UIViewController {

    
    @IBOutlet var txtCantIngreso:NuevoTextField?
    @IBOutlet var txtANotaIngreso:UITextView?
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
    @IBAction func GuardarIngreso() {
        DataHolder.sharedInstance.GuardaIng = Double((txtCantIngreso?.text)!)
    }
}
