//
//  ViewController.swift
//  gps
//
//  Created by Wallace Goncalves de Oliveira on 23/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    var manager = CLLocationManager();
    
//MARK: Actions
    
    @IBAction func ondeEstouTouched(sender: UIButton) {
        manager.requestLocation()
    }

//MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ligamos o delegate
        manager.delegate = self
        
        // ativamos a autorizacao do usuario
        manager.requestAlwaysAuthorization()
        
        // determinamos a precisao do nosso GPS
        manager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        
        // inicia o GPS -> Ativa uma leitura desenfreada das Lat e Long e
        // por isto consome muita bateria
        // manager.startUpdatingLocation()
    }
    
//MARK: CLLocationManagerDelegate
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var loca = locations.first
        
        if let myLoc = loca {
            print(myLoc.coordinate.latitude)
            print(myLoc.coordinate.longitude)
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error.description)
    }


}

