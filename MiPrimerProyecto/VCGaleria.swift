//
//  VCGaleria.swift
//  MiPrimerProyecto
//
//  Created by Pablo Hernadez Jiménez on 13/5/18.
//  Copyright © 2018 PABLO HERNANDEZ JIMENEZ. All rights reserved.
//

import UIKit
import Firebase


class VCGaleria: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, DataHolderDelegate{

    @IBOutlet var imgView:UIImageView?
    let imagenPicker=UIImagePickerController()
    var imgData:Data?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagenPicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*@IBAction func accionSalir(){
        if DataHolder.sharedInstance.accionSalir() {
            self.performSegue(withIdentifier: "salir", sender: self)
        }
    }*/
    
    /*func DHDBorrar(blfin: Bool) {
        if blfin{
            self.performSegue(withIdentifier: "salir", sender: self)
        }
    }*/
    /*@IBAction func accionBorrar(){
        DataHolder.sharedInstance.borrarCuenta(delegate: self)
    }*/
    
    
    @IBAction func accionBotonGaleria(){
        imagenPicker.allowsEditing = false
        imagenPicker.sourceType = .photoLibrary
        self.present(imagenPicker, animated: true, completion: nil)
        
    }
    @IBAction func accionBotonCamara(){
        imagenPicker.allowsEditing = false
        imagenPicker.sourceType = .camera
        self.present(imagenPicker, animated: true, completion: nil)
    }
    @IBAction func accionBotonSubir(){
        if imgData != nil{
            let tiempoMilis:Int = Int((Date().timeIntervalSince1970 * 1000.0).rounded())
            let ruta:String = String(format: "Perfiles/imagen%d.jpg", tiempoMilis)
            let perfiles = DataHolder.sharedInstance.fireStorageRef?.child(ruta)
            let uploadTask = perfiles?.putData(imgData! , metadata:nil){(metadata, error) in
                guard let metadata = metadata else{
                    return
                }
                let downloadURL = metadata.downloadURL()
                print("Mi url: ",downloadURL)
                DataHolder.sharedInstance.miPerfil.sImage = downloadURL?.absoluteString
                DataHolder.sharedInstance.saveUser()
            }
        }
    }
    @IBAction func editar(){
        self.performSegue(withIdentifier: "cambiarpass", sender: self)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let img = info[UIImagePickerControllerOriginalImage] as? UIImage
        imgData = UIImageJPEGRepresentation(img!, 0.5)
        imgView?.image = img
        self.dismiss(animated: true, completion: nil)
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
