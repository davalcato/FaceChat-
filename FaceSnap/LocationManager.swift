//
//  LocationManager.swift
//  FaceSnap
//
//  Created by Daval Cato on 10/29/16.
//  Copyright © 2016 Me2 Software. All rights reserved.
//

import UIKit
import CoreLocation

class LocationManager: NSObject {
    let manager = CLLocationManager()
    let geocoder = CLGeocoder()
    
    var onLocationFix: ((CLPlacemark?, NSError?) -> Void)?
    
    override init() {
        super.init()
        manager.delegate = self
        
        getPermission()
    }
    
     func getPermission() {
        if CLLocationManager.authorizationStatus() == .notDetermined {
            manager.requestWhenInUseAuthorization()
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            manager.requestLocation()
            
            func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
                switch status {
                case .notDetermined:
                    manager.requestAlwaysAuthorization()
                    break
                case .authorizedWhenInUse:
                    manager.startUpdatingLocation()
                    break
                case .authorizedAlways:
                    manager.startUpdatingLocation()
                    break
                case .restricted:
                    // restricted by e.g. parental controls. User can't enable Location Services
                    break
                case .denied:
                    // user denied your app access to Location Services, but can grant access from Settings.app
                    break
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Unresolved error  \(error), \(error._userInfo)")
    }
    
    @objc(locationManager:didUpdateLocations:) func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let onLocationFix = self.onLocationFix {
                onLocationFix(placemarks?.first, error as NSError?)
            }
        }
        
        
    }
}

















