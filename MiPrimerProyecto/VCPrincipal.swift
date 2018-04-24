//
//  VCPrincipal.swift
//  MiPrimerProyecto
//
//  Created by PABLO HERNANDEZ JIMENEZ on 24/4/18.
//  Copyright © 2018 PABLO HERNANDEZ JIMENEZ. All rights reserved.
//

import UIKit

class VCPrincipal: UIViewController {
    
    @IBOutlet var btnInfo:UIButton?
    @IBOutlet var btnIngreso:UIButton?
    @IBOutlet var btnGasto:UIButton?
    @IBOutlet var btnMenu:UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        btnInfo?.layer.cornerRadius = 15
        btnIngreso?.layer.cornerRadius = 15
        btnGasto?.layer.cornerRadius = 15
        btnMenu?.layer.cornerRadius = 15

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
