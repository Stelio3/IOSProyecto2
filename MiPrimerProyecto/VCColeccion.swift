//
//  VCColeccion.swift
//  MiPrimerProyecto
//
//  Created by PABLO HERNANDEZ JIMENEZ on 5/4/18.
//  Copyright © 2018 PABLO HERNANDEZ JIMENEZ. All rights reserved.
//

import UIKit

class VCColeccion: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, DataHolderDelegate{
    
    @IBOutlet var colPrincipal:UICollectionView?
   // var arPerfiles:[Perfil] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        DataHolder.sharedInstance.descargarPerfiles(delegate: self )
}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func DHDDescargaPerfilesCompleta(blFinPerfiles: Bool) {
        if blFinPerfiles{
            self.refreshUI()
        }
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
