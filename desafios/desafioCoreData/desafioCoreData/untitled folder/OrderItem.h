//
//  OrderItem.h
//  desafioCoreData
//
//  Created by Wallace Goncalves de Oliveira on 11/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Product;

NS_ASSUME_NONNULL_BEGIN

@interface OrderItem : NSManagedObject

// Insert code here to declare functionality of your managed object subclass

+(NSString*)entityName;
+(instancetype)newEntity:(NSManagedObjectContext*)context;

@end

NS_ASSUME_NONNULL_END

#import "OrderItem+CoreDataProperties.h"
