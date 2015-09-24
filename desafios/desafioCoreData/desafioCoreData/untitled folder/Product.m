//
//  Product.m
//  desafioCoreData
//
//  Created by Wallace Goncalves de Oliveira on 11/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Product.h"

@implementation Product

// Insert code here to add functionality to your managed object subclass

+(NSString *)entityName {
    return @"Product";
}

+(instancetype)newEntity:(NSManagedObjectContext *)context {
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:[Product entityName]
                                   inManagedObjectContext:context];
    
    Product *obj = [[Product alloc]
                    initWithEntity:entity
                    insertIntoManagedObjectContext:context];
    
    return obj;
}

@end