//
//  ViewController.swift
//  Map3.0
//
//  Created by Harsha R Mundaragi on 18/11/22.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home"
        
        mapView.delegate = self
        mapView.mapType = .satellite
        
            
        LocationManager.objectOfLocationManager.userLocation(){ [weak self] location in
            
            DispatchQueue.main.async {
                guard let strongSelf = self else{
                    return
            }
                self?.addCustomPin(locationData: location, sellf: strongSelf)
        }
            
        }
    }


    
    private func addCustomPin(locationData: CLLocation, sellf: MapViewController ){
        
        let pin = MKPointAnnotation()
        pin.title = "Yor Here"
        pin.subtitle = "Hi"
        pin.coordinate = locationData.coordinate
        self.mapView.setRegion(MKCoordinateRegion(center: locationData.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)), animated: true)
        self.mapView.addAnnotation(pin)
        LocationManager.objectOfLocationManager.giveLocationName(location: locationData){ [weak self] locatonDataForTitle in
            
            self?.title = locatonDataForTitle
            
        }
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else{
            
            return nil
        }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "custom")
        
        if annotationView == nil{
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
            
            annotationView?.canShowCallout = true
        }else{
            annotationView?.annotation = annotation
        }
        
        annotationView?.image = #imageLiteral(resourceName: "placeholder")
        
//        let transForm = CGAffineTransform(scaleX: 0.1, y: 0.1)
//        
//        annotationView?.transform = transForm
        return annotationView
    }
    

}

