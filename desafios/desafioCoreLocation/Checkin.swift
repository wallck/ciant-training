//
//  Checkin.swift
//  desafioCoreLocation
//
//  Created by Wallace Goncalves de Oliveira on 23/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

import Foundation
import CoreData

class Checkin: NSManagedObject {

    static var entityName: String {
        get {
            return "Checkin"
        }
    }
    
    static func newEntity(context: NSManagedObjectContext)->Checkin {
        let entity = NSEntityDescription.entityForName(self.entityName, inManagedObjectContext: context);
        return Checkin(entity: entity!, insertIntoManagedObjectContext: context);
    }
    
    static func select(fieldName: String?, byValue: AnyObject, orderBy: String?, ascending: Bool?, onContext: NSManagedObjectContext)->Array<Checkin> {
        let request = NSFetchRequest(entityName: self.entityName)
        
        if fieldName != nil {
            let filter = NSPredicate(format: "%K == \(byValue)", fieldName!)
            request.predicate = filter
        }
        
        if orderBy != nil {
            let sort = NSSortDescriptor(key: orderBy, ascending: ascending ?? true)
            request.sortDescriptors?.append(sort)
        }
        
        do  {
            let results: Array<Checkin> = try onContext.executeFetchRequest(request) as! Array<Checkin>
            return results;
        } catch {
            print("erro")
        }
        
        return [];
    }
}
