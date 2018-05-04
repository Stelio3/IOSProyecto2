//
//  CVCMiCelda2.swift
//  MiPrimerProyecto
//
//  Created by PABLO HERNANDEZ JIMENEZ on 5/4/18.
//  Copyright © 2018 PABLO HERNANDEZ JIMENEZ. All rights reserved.
//

import UIKit

class CVCMiCelda2: UICollectionViewCell, DataHolderDelegate {
    
    @IBOutlet var imgvMain:UIImageView?
    @IBOutlet var lblNombre:UILabel?
    @IBOutlet var lblApellido:UILabel?
    var imagenDescargada:UIImage?
    
    func mostrarImagen(uri:String) {
        // Create a reference to the file you want to download
        self.imgvMain?.image = nil
        DataHolder.sharedInstance.getImage(clave: uri, getDelegate: self)
    }
    func DHDImagenDescargada(imagen: UIImage) {
        self.imgvMain?.image = imagen
        
    }}
