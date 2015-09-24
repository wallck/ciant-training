//
//  OrderItem.m
//  desafioCoreData
//
//  Created by Wallace Goncalves de Oliveira on 11/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "OrderItem.h"
#import "Product.h"

@implementation OrderItem

// Insert code here to add functionality to your managed object subclass

+(NSString *)entityName {
    return @"OrderItem";
}

+(instancetype)newEntity:(NSManagedObjectContext *)context {
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:[OrderItem entityName]
                                   inManagedObjectContext:context];
    
    OrderItem *obj = [[OrderItem alloc]
                      initWithEntity:entity
                      insertIntoManagedObjectContext:context];
    
    return obj;
}

@end
