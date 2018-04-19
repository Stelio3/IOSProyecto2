//
//  VCColeccion.swift
//  MiPrimerProyecto
//
//  Created by PABLO HERNANDEZ JIMENEZ on 5/4/18.
//  Copyright © 2018 PABLO HERNANDEZ JIMENEZ. All rights reserved.
//

import UIKit

class VCColeccion: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var colPrincipal:UICollectionView?
   // var arPerfiles:[Perfil] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataHolder.sharedInstance.FireStoreDB?.collection("Perfiles")
            .addSnapshotListener { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    DataHolder.sharedInstance.arPerfiles=[]
                    for document in querySnapshot!.documents {
                        let perfil:Perfil = Perfil()
                        perfil.sID=document.documentID
                        perfil.setMap(valores: document.data())
                        DataHolder.sharedInstance.arPerfiles.append(perfil)
                        
                        print("\(document.documentID) => \(document.data())")
                    }
                    print(DataHolder.sharedInstance.arPerfiles.count)
                    self.refreshUI()
                    
                    
                }
        // Do any additional setup after loading the view.
    }
}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataHolder.sharedInstance.arPerfiles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CVCMiCelda2 = collectionView.dequeueReusableCell(withReuseIdentifier: "micelda2", for: indexPath) as! CVCMiCelda2
        cell.lblNombre?.text = DataHolder.sharedInstance.arPerfiles[indexPath.row].sNombre
        cell.lblApellido?.text = DataHolder.sharedInstance.arPerfiles[indexPath.row].sEmail
        cell.mostrarImage(uri: DataHolder.sharedInstance.arPerfiles[indexPath.row].sImage!)


        /*if indexPath.row == 0
        {
            cell.lblNombre?.text="Jaime"
            cell.imgvMain?.image=UIImage(named: "descarga.jpeg")
        }
        else if (indexPath.row == 1)
        {
            cell.lblNombre?.text="Yony"
            cell.imgvMain?.image=UIImage(named: "descarga.jpeg")
        }
        else if (indexPath.row == 2)
        {
            cell.lblNombre?.text="Pedro"
            cell.imgvMain?.image=UIImage(named: "descarga.jpeg")
        }
        else if (indexPath.row == 3)
        {
            cell.lblNombre?.text="Pablo"
            cell.imgvMain?.image=UIImage(named: "descarga.jpeg")
        }
        else if (indexPath.row == 4)
        {
            cell.lblNombre?.text="Javier"
            cell.imgvMain?.image=UIImage(named: "descarga.jpeg")
        }*/
        return cell
    }
    func refreshUI() {
        DispatchQueue.main.async(execute: {
            self.colPrincipal?.reloadData()
        })
    }    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
