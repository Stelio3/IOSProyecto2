//
//  VCMapa.swift
//  MiPrimerProyecto
//
//  Created by Pablo Hernadez Jiménez on 12/4/18.
//  Copyright © 2018 PABLO HERNANDEZ JIMENEZ. All rights reserved.
//

import UIKit
import MapKit
class VCMapa: UIViewController, LocationAdminDelegate{

    @IBOutlet var MiMapa:MKMapView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MiMapa?.showsUserLocation = true
       // MiMapa?.delegate = self as? MKMapViewDelegate
       // DataHolder.sharedInstance.locationAdmin?.delegate=self
        var coordTemp:CLLocationCoordinate2D = CLLocationCoordinate2D()
        coordTemp.latitude = 40.4165000
        coordTemp.longitude = -3.7025600
        agragarPin(coordenada: coordTemp, titulo: "PIN1 ")
        
        var coordTemp2:CLLocationCoordinate2D = CLLocationCoordinate2D()
        coordTemp2.latitude = 40.4165000
        coordTemp2.longitude = -4.7025600
        agragarPin(coordenada: coordTemp2, titulo: "PIN2 ")       // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func localizacionActualizada(coordenada:CLLocationCoordinate2D)  {
        centralizarEnPosicion(coordenada:coordenada)
    }
    
    func agragarPin(coordenada:CLLocationCoordinate2D, titulo tpin:String){
        let annotation:MKPointAnnotation = MKPointAnnotation()
        annotation.coordinate = coordenada
        annotation.title = tpin
        MiMapa?.addAnnotation(annotation)
    }
    
    func centralizarEnPosicion(coordenada:CLLocationCoordinate2D) {
        let region:MKCoordinateRegion = MKCoordinateRegion(center: coordenada, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        MiMapa?.setRegion(region, animated: true)
    }
    
    func mapView(_ mapView:MKMapView, didUpdate userLocation: MKUserLocation) {
        centralizarEnPosicion(coordenada: userLocation.coordinate)
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
