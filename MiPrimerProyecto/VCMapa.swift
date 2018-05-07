//
//  VCMap.swift
//  TrabajoFinal
//
//  Created by Miguel Angel Martinez Gonzalez on 19/4/18.
//  Copyright © 2018 Miguel Angel Martinez Gonzalez. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class VCMapa: UIViewController, CLLocationManagerDelegate, DataHolderDelegate{
    @IBOutlet var miMap:MKMapView?
    var locationManager:CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataHolder.sharedInstance.descargarCiudades(delegate: self)
        self.nuevaRegionMapa(latitude: 40.5, longitude: -3.666667)
        locationManager = CLLocationManager()
        locationManager?.delegate=self
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
        miMap?.showsUserLocation=true
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func DHDDescargaCiudadesCompleta(blFinCiudades: Bool) {
        if blFinCiudades{
        for ciudades in DataHolder.sharedInstance.arCiudades{
            if ciudades.iLatitude != nil{
                self.AgregarPin(titulo: ciudades.sName!, latitude: ciudades.iLatitude!, longitude: ciudades.iLongitud!)
            }
        }
        }
        
    }

    func AgregarPin(titulo:String, latitude lat: Double, longitude lon:Double ) {
        let miPin:MKPointAnnotation=MKPointAnnotation()
        miPin.coordinate.latitude=lat
        miPin.coordinate.longitude=lon
        miPin.title = titulo
        miMap?.addAnnotation(miPin)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations[0])
        //self.nuevaRegionMapa(latitude:locations[0].coordinate.latitude, longitude:locations[0].coordinate.longitude)
    }
    
    func nuevaRegionMapa(latitude lat:Double,longitude lon:Double){
        let miSpan:MKCoordinateSpan=MKCoordinateSpan(latitudeDelta:9,longitudeDelta:9)
        let puntoCentro:CLLocationCoordinate2D=CLLocationCoordinate2D(latitude: lat, longitude: lon)
        let miRegion:MKCoordinateRegion=MKCoordinateRegion(center:puntoCentro , span: miSpan)
        miMap?.setRegion(miRegion, animated: true)
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
