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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TVCMiCelda = tableView.dequeueReusableCell(withIdentifier: "micelda1") as! TVCMiCelda
        if indexPath.row == 0
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
        return cell
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
