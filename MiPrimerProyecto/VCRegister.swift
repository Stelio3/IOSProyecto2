//
//  VCRegister.swift
//  MiPrimerProyecto
//
//  Created by PABLO HERNANDEZ JIMENEZ on 3/4/18.
//  Copyright © 2018 PABLO HERNANDEZ JIMENEZ. All rights reserved.
//

import UIKit
import FirebaseAuth

class VCRegister: UIViewController, DataHolderDelegate {

    @IBOutlet var txtUsureg:UITextField?
    @IBOutlet var txtPassReg:UITextField?
    @IBOutlet var txtRepPass:UITextField?
    @IBOutlet var txtEmail:UITextField?
    @IBOutlet var btnSingIn:UIButton?
    @IBOutlet var btnGoLogin:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSingIn?.layer.cornerRadius = 10
        btnGoLogin?.layer.cornerRadius = 10
        //txtUsureg?.text = DataHolder.sharedInstance.sNick
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func DHDRegisterOk(blRegister: Bool) {
        if blRegister{
            self.performSegue(withIdentifier: "trregister", sender: self)
        }
    }
    
    @IBAction func clickRegistrar(){
        DataHolder.sharedInstance.miPerfil.sNombre = txtUsureg?.text
        DataHolder.sharedInstance.miPerfil.sEmail = txtEmail?.text
        
        DataHolder.sharedInstance.clickRegistrarDH(emailR: (txtEmail?.text)!, passR: (txtPassReg?.text)!, repassR: (txtRepPass?.text)!, name: (txtUsureg?.text)!, delegate: self)
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
