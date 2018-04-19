//
//  CVCMiCelda2.swift
//  MiPrimerProyecto
//
//  Created by PABLO HERNANDEZ JIMENEZ on 5/4/18.
//  Copyright © 2018 PABLO HERNANDEZ JIMENEZ. All rights reserved.
//

import UIKit

class CVCMiCelda2: UICollectionViewCell {
    
    @IBOutlet var imgvMain:UIImageView?
    @IBOutlet var lblNombre:UILabel?
    @IBOutlet var lblApellido:UILabel?
    var imagenDescargada:UIImage?
    
    func mostrarImage(uri:String) {
        // Create a reference to the file you want to download
        self.imgvMain?.image = nil
        //if imagenDescargada == nil{
        let gsReference = DataHolder.sharedInstance.firStorage?.reference(forURL: uri)
        
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        gsReference?.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if error != nil{
                // Uh-oh, an error occurred!
            } else {
                // Data for "images/island.jpg" is returned
                //let image = UIImage(data: data!)
                self.imagenDescargada = UIImage(data: data!)
                self.imgvMain?.image = self.imagenDescargada
            }
        }
        // }
    }
}
