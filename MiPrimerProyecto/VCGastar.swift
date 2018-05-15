//
//  VCGastar.swift
//  MiPrimerProyecto
//
//  Created by PABLO HERNANDEZ JIMENEZ on 8/5/18.
//  Copyright © 2018 PABLO HERNANDEZ JIMENEZ. All rights reserved.
//

import UIKit

class VCGastar: UIViewController {
    
    @IBOutlet var txtCantGasto:NuevoTextField?
    @IBOutlet var txtANotaGasto:UITextView?
    @IBOutlet var btnGuardarGasto:UIButton?
    @IBOutlet var btnCancelarGasto:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyBoardWhenTappedAround()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func GuardarGasto(){
        DataHolder.sharedInstance.GuardaGas = Double((txtCantGasto?.text)!)
        self.performSegue(withIdentifier: "trgastar", sender: self)
    }

}
