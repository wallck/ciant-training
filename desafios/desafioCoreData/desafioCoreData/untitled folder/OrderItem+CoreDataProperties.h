//
//  OrderItem+CoreDataProperties.h
//  desafioCoreData
//
//  Created by Wallace Goncalves de Oliveira on 11/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "OrderItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrderItem (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *quantity;
@property (nullable, nonatomic, retain) NSNumber *totalPrice;
@property (nullable, nonatomic, retain) NSManagedObject *order;
@property (nullable, nonatomic, retain) Product *product;

@end

NS_ASSUME_NONNULL_END
