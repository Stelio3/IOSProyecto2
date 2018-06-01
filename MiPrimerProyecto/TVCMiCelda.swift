//
//  TVCMiCelda.swift
//  MiPrimerProyecto
//
//  Created by PABLO HERNANDEZ JIMENEZ on 5/4/18.
//  Copyright © 2018 PABLO HERNANDEZ JIMENEZ. All rights reserved.
//

import UIKit

class TVCMiCelda: UITableViewCell, DataHolderDelegate {

    @IBOutlet var lblCantidad:UILabel?
    @IBOutlet var lblNota:UILabel?
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
        DataHolder.sharedInstance.getImage(clave: uri, getDelegate: self)
    }
    func DHDImagenDescargada(imagen: UIImage) {
        self.lblImagen?.image = imagen
        
    }
}
