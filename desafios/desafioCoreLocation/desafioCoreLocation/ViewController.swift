//
//  ViewController.swift
//  desafioCoreLocation
//
//  Created by Wallace Goncalves de Oliveira on 23/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate {
    
    var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
    var context: NSManagedObjectContext?;
    
    var locationManager = CLLocationManager()
    var checkin: Checkin? = nil
    
    //MARK: Outlets
    
    @IBOutlet weak var mapView: MKMapView!
    
    //MARK: Actions
    
    @IBAction func checkin(sender: UIButton) {
        let alert = alertSheetController()
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            let action = alertActionForSourceType(UIImagePickerControllerSourceType.Camera)
            alert.addAction(action)
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    //MARK: Helpers
    
    func alertSheetController()->UIAlertController {
        return UIAlertController(title: "Escolha a origem", message: nil, preferredStyle:UIAlertControllerStyle.ActionSheet)
    }
    
    func alertActionForSourceType(sourceType: UIImagePickerControllerSourceType)->UIAlertAction {
        let sheetTitle = titleForSheetWithSourceType(sourceType)
        return UIAlertAction(title: sheetTitle, style: UIAlertActionStyle.Default) { (action: UIAlertAction) -> Void in
            let picker = self.imagePickerWithSourceType(sourceType)
            self.presentViewController(picker, animated: true, completion: nil)
        }
    }
    
    func titleForSheetWithSourceType(sourceType: UIImagePickerControllerSourceType)->String {
        switch sourceType {
            case UIImagePickerControllerSourceType.Camera: return "Camera";
            case UIImagePickerControllerSourceType.PhotoLibrary: return "Photo Library";
            case UIImagePickerControllerSourceType.SavedPhotosAlbum: return "Saved Photos Album";
        }
    }
    
    func imagePickerWithSourceType(sourceType: UIImagePickerControllerSourceType)->UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = self
        picker.allowsEditing = true
        return picker
    }
    
    func initContextFromAppDelegate() {
        context = appDelegate.managedObjectContext;
    }
    func initLocationManager() {
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
    }
    
    //MARK: UIImagePickerControllerDelegate
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        //TODO: SALVAR IMAGEM
        checkin = Checkin.newEntity(context!)
        checkin!.picture = image
        locationManager.requestLocation()
        
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK: CLLocationManagerDelegate
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let loca = locations.last
        
        if let myLoc = loca {
            
            let checkins: Array<Checkin> = Checkin.select("latitude", byValue: myLoc.coordinate.latitude, orderBy: nil, ascending: nil, onContext: self.context!)
            let exists = checkins.contains({ (c) -> Bool in
                return c.longitude == myLoc.coordinate.longitude
            })
            
            if !exists {
                checkin!.latitude = myLoc.coordinate.latitude
                checkin!.longitude = myLoc.coordinate.longitude
                appDelegate.saveContext()
            } else {
                checkin = nil
            }
            
            print(checkin);
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error.description)
    }
    
    //MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initContextFromAppDelegate()
        self.initLocationManager()
    }
}