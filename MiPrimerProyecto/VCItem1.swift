//
//  VCItem1.swift
//  MiPrimerProyecto
//
//  Created by PABLO HERNANDEZ JIMENEZ on 5/4/18.
//  Copyright © 2018 PABLO HERNANDEZ JIMENEZ. All rights reserved.
//

import UIKit

class VCItem1: UIViewController, UITableViewDelegate, UITableViewDataSource, DataHolderDelegate {

    @IBOutlet var tabla:UITableView?
    @IBOutlet var btnMingresos:UIButton?
    @IBOutlet var btnMgastos:UIButton?
   // var arCiudades:[City] = []
    var arIGFiltrado:[NotaDinero] = []
    
    var iFiltroActual:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.filtrar(tipoFiltro: 0)
        //DataHolder.sharedInstance.descargarCiudades(delegate: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func filtrar(tipoFiltro:Int) {
        arIGFiltrado = []
        if(tipoFiltro == 0){
             arIGFiltrado.append(contentsOf: DataHolder.sharedInstance.miPerfil.arGastos)
            arIGFiltrado.append(contentsOf: DataHolder.sharedInstance.miPerfil.arIngresos)
        }else if (tipoFiltro == 1){
            arIGFiltrado.append(contentsOf: DataHolder.sharedInstance.miPerfil.arGastos)
        }else if (tipoFiltro == 2){
            arIGFiltrado.append(contentsOf: DataHolder.sharedInstance.miPerfil.arIngresos)
        }
        self.refreshUI()
        iFiltroActual = tipoFiltro
    }
    
    /*func DHDDescargaCiudadesCompleta(blFinCiudades: Bool) {
        if blFinCiudades{
            self.refreshUI()
        }
    }*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arIGFiltrado.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var celda:UITableViewCell?

        print("!!!!!!!!!!!     ",arIGFiltrado[indexPath.row].iTipo)
        if arIGFiltrado[indexPath.row].iTipo == 0{
            let gastos:TVCMiCelda = tableView.dequeueReusableCell(withIdentifier: "micelda1") as! TVCMiCelda//CELDA GASTO!!!!!!!
            let gastoTemp:Gasto = arIGFiltrado[indexPath.row] as! Gasto//OBJETO GASTO!!!!!!!!!!!
            gastos.lblCantidad?.text = String(format: "%.2f €",gastoTemp.sGasto!)
            gastos.lblNota?.text = gastoTemp.sNotaG
            celda = gastos
            
        }
        else if arIGFiltrado[indexPath.row].iTipo == 1{
            let ingresos:TVCMiCelda = tableView.dequeueReusableCell(withIdentifier: "micelda1") as! TVCMiCelda
            let ingresoTemp:Ingreso = arIGFiltrado[indexPath.row] as! Ingreso
            ingresos.lblCantidad?.text = String(format: "%.2f €", ingresoTemp.sIngreso!)
            ingresos.lblNota?.text = ingresoTemp.sNotaI
           
            celda = ingresos
            
        }
        return celda!
    }
    
    @IBAction func MostrarIngresos(){
        if (btnMingresos?.isSelected)! {//SI SE ESTA MOSTRANDO INGRESOS
            if iFiltroActual == 2 {//SE ESTAN MOSTRANDO SOLO LOS INGRESOS
                self.filtrar(tipoFiltro: -1)
            }
            else if iFiltroActual == 0 {//SE ESTAN MOSTRANDO TODOS
                self.filtrar(tipoFiltro: 1)
            }
            btnMingresos?.isSelected = false
        }
        else{//SI NO SE ESTA MOSTRANDO INGRESOS
            if iFiltroActual == -1 {//NO SE ESTA MOSTRANDO NADA
                self.filtrar(tipoFiltro: 2)
            }
            else if iFiltroActual == 1 {//SE ESTAN MOSTRANDO SOLO LOS GASTOS
                self.filtrar(tipoFiltro: 0)
            }
            btnMingresos?.isSelected = true
        }
        
    }
    @IBAction func MostrarGastos(){
        if (btnMgastos?.isSelected)! {//SI SE ESTA MOSTRANDO GASTOS
            if iFiltroActual == 1 {//SE ESTAN MOSTRANDO SOLO LOS GASTOS
                self.filtrar(tipoFiltro: -1)
            }
            else if iFiltroActual == 0 {//SE ESTAN MOSTRANDO TODOS
                self.filtrar(tipoFiltro: 2)
            }
            btnMgastos?.isSelected = false
        }
        else{//SI NO SE ESTA MOSTRANDO GASTOS
            if iFiltroActual == -1 {//NO SE ESTA MOSTRANDO NADA
                self.filtrar(tipoFiltro: 1)
            }
            else if iFiltroActual == 2 {//SE ESTAN MOSTRANDO SOLO LOS INGRESOS
                self.filtrar(tipoFiltro: 0)
            }
            btnMgastos?.isSelected = true
        }
    }
    
    func refreshUI() {
        DispatchQueue.main.async(execute: {
            self.tabla?.reloadData()
        })
    }

}
