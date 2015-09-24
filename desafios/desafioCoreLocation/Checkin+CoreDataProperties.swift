//
//  Checkin+CoreDataProperties.swift
//  desafioCoreLocation
//
//  Created by Wallace Goncalves de Oliveira on 23/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Checkin {

    @NSManaged var latitude: NSNumber?
    @NSManaged var longitude: NSNumber?
    @NSManaged var picture: NSObject?
    @NSManaged var title: String?
    @NSManaged var comment: String?

}
