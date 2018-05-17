//
//  ViewController.swift
//  MiPrimerProyecto
//
//  Created by PABLO HERNANDEZ JIMENEZ on 22/3/18.
//  Copyright © 2018 PABLO HERNANDEZ JIMENEZ. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController, DataHolderDelegate {

    @IBOutlet var txtUser:NuevoTextField?
    @IBOutlet var txtPass:NuevoTextField?
    @IBOutlet var btnRegistra:UIButton?
    @IBOutlet var btnLogin:UIButton?
    @IBOutlet var recordad:UISwitch?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyBoardWhenTappedAround()
        btnRegistra?.layer.cornerRadius = 10
        btnLogin?.layer.cornerRadius = 10
        // Do any additional setup after loading the view, typically from a nib.
       /* if (!(DataHolder.sharedInstance.user?.isEmpty)!){
            loguearse()
        }*/
        txtUser?.text = DataHolder.sharedInstance.user
        txtPass?.text = DataHolder.sharedInstance.pass
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil{
                DataHolder.sharedInstance.firUser = user
                self.performSegue(withIdentifier: "trlogin", sender: self)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func DHDLoginOk(blLogin: Bool) {
        if blLogin {
            if (recordad?.isOn)!{
                DataHolder.sharedInstance.user = txtUser?.text
                DataHolder.sharedInstance.pass = txtPass?.text
                DataHolder.sharedInstance.saveData()
            }
            self.performSegue(withIdentifier: "trlogin", sender: self)
        }
    }
    func loguearse(){
        DataHolder.sharedInstance.eventoClickLoginDH(email: (txtUser?.text)!, pass: (txtPass?.text)!, delegate: self )
    }
    @IBAction func eventoClickLogin(delegate: DataHolderDelegate){
       loguearse()
    }

}

