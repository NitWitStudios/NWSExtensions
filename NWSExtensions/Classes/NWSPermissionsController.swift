//
//  NWSPermissionsController.swift
//  Pods
//
//  Created by James Hickman on 3/14/17.
//
//

import Foundation
import CoreLocation

public protocol NWSPermissionsControllerDelegate {
    func permissionsController(_ permissionsController: NWSPermissionsController, didAllowLocationPermission: Bool)
}

public class NWSPermissionsController: NSObject, CLLocationManagerDelegate {
    var delegate: NWSPermissionsControllerDelegate?
    var locationManager: CLLocationManager!
    var userLocation: CLLocation?
    var distanceFilter: Double = 1609.34 * 1.0 // Meters x Miles
    
    // MARK: - Init
    
    override init() {
        super.init()
        
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.distanceFilter = distanceFilter
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        self.locationManager = locationManager
        
        if CLLocationManager.authorizationStatus() == .authorizedAlways || CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    
    // MARK: - NWSPermissionsController
   
    public func isLocationPermissionAuthorized() -> Bool {
        return CLLocationManager.authorizationStatus() == .authorizedWhenInUse || CLLocationManager.authorizationStatus() == .authorizedAlways
    }
    
    public func requestLocationPermission() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    // MARK: CLLocationManagerDelegate
    
    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationManager.startUpdatingLocation()
        
        delegate?.permissionsController(self, didAllowLocationPermission: status == .authorizedAlways)
    }
}
