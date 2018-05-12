//
//  NuevoTextField.swift
//  MiPrimerProyecto
//
//  Created by Pablo Hernadez Jiménez on 12/5/18.
//  Copyright © 2018 PABLO HERNANDEZ JIMENEZ. All rights reserved.
//

import UIKit

class NuevoTextField: UITextField, UITextFieldDelegate {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        delegate=self
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.resignFirstResponder()
        return false
    }
}
