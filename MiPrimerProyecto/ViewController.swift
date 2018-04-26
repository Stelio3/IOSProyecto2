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

    @IBOutlet var txtUser:UITextField?
    @IBOutlet var txtPass:UITextField?
    @IBOutlet var btnRegistra:UIButton?
    @IBOutlet var btnLogin:UIButton?
    @IBOutlet var txtVConsola:UITextView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnRegistra?.layer.cornerRadius = 10
        btnLogin?.layer.cornerRadius = 10
        // Do any additional setup after loading the view, typically from a nib.
        txtUser?.text = DataHolder.sharedInstance.sNick
        
       /* do{
           try Auth.auth().signOut()
        catch{
        
            }
        }
        */
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil{
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
            self.performSegue(withIdentifier: "trlogin", sender: self)
        }
    }
    
    @IBAction func eventoClickLogin(delegate: DataHolderDelegate){
        //if txtUser?.text == "Pablo" && txtPass?.text == "123"{
          //  self.performSegue(withIdentifier: "tran1", sender: self)
      //  }
       // else{
          //  txtVConsola?.text=String(format: "Usuario incorrecto: Esperaba en usuario: Pablo y contraseña: 123 e introdujo usuario: %@ y contaseña: %@", (txtUser?.text)!,(txtPass?.text)!)
        
       DataHolder.sharedInstance.eventoClickLoginDH(email: (txtUser?.text)!, pass: (txtPass?.text)!, delegate: self )
    }

}

