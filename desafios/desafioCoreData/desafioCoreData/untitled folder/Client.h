//
//  Client.h
//  desafioCoreData
//
//  Created by Wallace Goncalves de Oliveira on 11/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Client : NSManagedObject

// Insert code here to declare functionality of your managed object subclass

+(NSString*)entityName;
+(instancetype)newEntity:(NSManagedObjectContext*)context;
+(instancetype)firstByName:(NSString*)name context:(NSManagedObjectContext*)context;

@end

NS_ASSUME_NONNULL_END

#import "Client+CoreDataProperties.h"
