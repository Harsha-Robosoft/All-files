//
//  ViewController.swift
//  Map
//
//  Created by Harsha R Mundaragi on 18/11/22.
//

import UIKit
import MapKit

import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
//    let coordinateIs = CLLocationCoordinate2D(latitude: 13.3893978, longitude: 74.6963071)
    let manager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mapView.delegate = self
        mapView.mapType = .satellite
        addCustomPin()
    }

    private func addCustomPin(){
        
        let pin = MKPointAnnotation()
        pin.title = "Yor Here"
        pin.subtitle = "Hi"
//        pin.coordinate = coordinateIs
        mapView.addAnnotation(pin)
        
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
        
        annotationView?.image = #imageLiteral(resourceName: "istockphoto-1147484807-612x612")
        
        let transForm = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        annotationView?.transform = transForm
        return annotationView
    }

    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(true)
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            manager.stopUpdatingLocation()
            
            render(location)
        }
    }
    
    func render(_ location: CLLocation) {
        
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
//        let coordinate = CLLocationCoordinate2D(latitude: coordinateIs.latitude, longitude: coordinateIs.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        mapView.setRegion(region, animated: true)
        
        
    }
}

