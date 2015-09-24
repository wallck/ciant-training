//
//  Order+CoreDataProperties.m
//  desafioCoreData
//
//  Created by Wallace Goncalves de Oliveira on 11/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Order+CoreDataProperties.h"

@implementation Order (CoreDataProperties)

@dynamic orderDate;
@dynamic totalPrice;
@dynamic client;
@dynamic orderItens;

@end
