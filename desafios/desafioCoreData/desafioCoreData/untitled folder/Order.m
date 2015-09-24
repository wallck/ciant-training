//
//  Order.m
//  desafioCoreData
//
//  Created by Wallace Goncalves de Oliveira on 11/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Order.h"
#import "Client.h"
#import "OrderItem.h"

@implementation Order

// Insert code here to add functionality to your managed object subclass

+(NSString *)entityName {
    return @"Order";
}

+(instancetype)newEntity:(NSManagedObjectContext *)context {
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:[Order entityName]
                                   inManagedObjectContext:context];
    
    Order *obj = [[Order alloc]
                  initWithEntity:entity
                  insertIntoManagedObjectContext:context];
    
    return obj;
}

@end
