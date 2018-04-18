//
//  TVCMiCelda.swift
//  MiPrimerProyecto
//
//  Created by PABLO HERNANDEZ JIMENEZ on 5/4/18.
//  Copyright © 2018 PABLO HERNANDEZ JIMENEZ. All rights reserved.
//

import UIKit

class TVCMiCelda: UITableViewCell {

    @IBOutlet var lblNombre:UILabel?
    @IBOutlet var lblPais:UILabel?
    @IBOutlet var lblImagen:UIImageView?
    var imagenDescargada:UIImage?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func mostrarImagen(uri:String) {
        // Create a reference to the file you want to download
        self.lblImagen?.image = nil
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
                    self.lblImagen?.image = self.imagenDescargada
                }
            }
       // }
    }
}
