//
//  ViewController.swift
//  CLTest
//
//  Created by Rollin Francois on 9/1/17.
//  Copyright © 2017 Francois Technology. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var latitudeValue: UILabel!
    @IBOutlet weak var longitudeValue: UILabel!
    @IBOutlet weak var distanceValue: UILabel!
    @IBOutlet weak var toggleButton: UIButton!
    
    var locationManager:CLLocationManager? = nil
    var lastLocation:CLLocation? = nil
    var isReceivingLocationUpdates:Bool = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager!.delegate = self
        locationManager!.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        
        lastLocation = CLLocation(latitude: 51.5001524, longitude: -0.1262362)
        
        toggleButton.titleLabel!.text = "Start location updates"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus)
    {
        var shouldAllow = false
        
        switch status {
        case CLAuthorizationStatus.authorizedWhenInUse:
            shouldAllow = true
        case CLAuthorizationStatus.authorizedAlways:
            shouldAllow = true
        default:
            shouldAllow = false
        }
        
        if shouldAllow == true {
            isReceivingLocationUpdates = true
            toggleButton.titleLabel!.text = "Stop location updates"
            manager.startUpdatingLocation()
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let locationArray = locations as NSArray
        for newLocation in locationArray
        {
            // lat/lon values should only be considered if
            // horizontalAccuracy is not negative.
            if (newLocation as AnyObject).horizontalAccuracy >= 0
            {
                let currentLatitude:CLLocationDegrees = (newLocation as AnyObject).coordinate.latitude;
                let currentLongitude:CLLocationDegrees = (newLocation as AnyObject).coordinate.longitude;
                let distanceTravelled = (newLocation as AnyObject).distance(from: lastLocation!)
                
                latitudeValue.text = "\(currentLatitude)"
                longitudeValue.text = "\(currentLongitude)"
                distanceValue.text = "\(distanceTravelled)"
                
                lastLocation = newLocation as? CLLocation
            }
        }
        
    }
    
    
    @IBAction func onButtonPressed(_ sender: AnyObject) {
        
        if isReceivingLocationUpdates == false
        {
            if CLLocationManager.authorizationStatus() != CLAuthorizationStatus.authorizedWhenInUse
            {
                locationManager!.requestWhenInUseAuthorization()
            }
            else
            {
                isReceivingLocationUpdates = true
                toggleButton.titleLabel!.text = "Stop location updates"
                
                locationManager!.startUpdatingLocation()
            }
        }
        else
        {
            isReceivingLocationUpdates = false
            
            toggleButton.titleLabel!.text = "Start location updates"
            
            locationManager!.stopUpdatingLocation()
        }
        
    }
    
}
