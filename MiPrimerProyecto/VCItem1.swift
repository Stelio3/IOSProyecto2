//
//  VCItem1.swift
//  MiPrimerProyecto
//
//  Created by PABLO HERNANDEZ JIMENEZ on 5/4/18.
//  Copyright © 2018 PABLO HERNANDEZ JIMENEZ. All rights reserved.
//

import UIKit

class VCItem1: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tabla:UITableView?
    var arCiudades:[City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataHolder.sharedInstance.FireStoreDB?.collection("cities")
            .addSnapshotListener { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    self.arCiudades=[]
                    for document in querySnapshot!.documents {
                        let ciudad:City = City()
                        ciudad.sID=document.documentID
                        ciudad.setMap(valores: document.data())
                        self.arCiudades.append(ciudad)
                        
                        print("\(document.documentID) => \(document.data())")
                    }
                    print(self.arCiudades.count)
                    self.refreshUI()
                    
                    
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arCiudades.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TVCMiCelda = tableView.dequeueReusableCell(withIdentifier: "micelda1") as! TVCMiCelda
        cell.lblNombre?.text = self.arCiudades[indexPath.row].sName
        cell.lblPais?.text = self.arCiudades[indexPath.row].sCountry
        cell.mostrarImagen(uri: self.arCiudades[indexPath.row].sUrlImage!)
        
        /*if indexPath.row == 0
        {
            cell.lblNombre?.text="Jaime"
            cell.lblImagen?.image=UIImage(named: "descarga.jpeg")
        }
        else if (indexPath.row == 1)
        {
            cell.lblNombre?.text="Yony"
            cell.lblImagen?.image=UIImage(named: "descarga.jpeg")
        }
        else if (indexPath.row == 2)
        {
            cell.lblNombre?.text="Pedro"
            cell.lblImagen?.image=UIImage(named: "descarga.jpeg")
            
        }
        else if (indexPath.row == 3)
        {
            cell.lblNombre?.text="Pablo"
            cell.lblImagen?.image=UIImage(named: "descarga.jpeg")
            
        }
        else if (indexPath.row == 4)
        {
            cell.lblNombre?.text="Javier"
            cell.lblImagen?.image=UIImage(named: "descarga.jpeg")
        }
 */
        return cell
    }
    
    func refreshUI() {
        DispatchQueue.main.async(execute: {
            self.tabla?.reloadData()
        })
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
