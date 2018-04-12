//
//  VCRegister.swift
//  MiPrimerProyecto
//
//  Created by PABLO HERNANDEZ JIMENEZ on 3/4/18.
//  Copyright © 2018 PABLO HERNANDEZ JIMENEZ. All rights reserved.
//

import UIKit
import FirebaseAuth

class VCRegister: UIViewController {

    @IBOutlet var txtUsureg:UITextField?
    @IBOutlet var txtPassReg:UITextField?
    @IBOutlet var txtRepPass:UITextField?
    @IBOutlet var txtEmail:UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtUsureg?.text = DataHolder.sharedInstance.sNick
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickRegistrar(){
        Auth.auth().createUser(withEmail: (txtEmail?.text)!, password: (txtPassReg?.text)!) { (User, error) in
            if User != nil{
                print("Te registraste")
                self.performSegue(withIdentifier: "", sender: self)
                DataHolder.sharedInstance.FireStoreDB?.collection("Perfiles").document((User?.uid)!).setData([
                "first": "Yony",
                "last": "BM",
                "born": 1815])
            }else{
                print(error!)
            }
        }
        print("HOLA!!" )
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
