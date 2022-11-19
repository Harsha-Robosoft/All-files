//
//  Location manager.swift
//  Map3.0
//
//  Created by Harsha R Mundaragi on 18/11/22.
//
import CoreLocation
import Foundation


class LocationManager: NSObject,CLLocationManagerDelegate  {
    
    static let objectOfLocationManager = LocationManager()
    
    let manager = CLLocationManager()
    
    var completion: ((CLLocation) -> Void)?
    
    public func userLocation(completion: @escaping ((CLLocation) -> Void)){
        
        self.completion = completion
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
        guard let location = locations.first else{
            return
        }
        
        completion?(location)
        manager.stopUpdatingLocation()
    }
    
    public func giveLocationName(location: CLLocation, completion: @escaping((String?) -> Void)){
        
        let geoCode = CLGeocoder()
        geoCode.reverseGeocodeLocation(location, preferredLocale: .current){ plceMark , error in
            
            guard let place = plceMark?.first , error == nil else{
                completion(nil)
                return
            }
            
            var name = ""
            if let locality = place.locality{
                name.append(locality)
            }
            
            if let adminRegion = place.administrativeArea{
                name.append(", \(adminRegion)")
            }
            
            completion(name)
        }
    }
}
