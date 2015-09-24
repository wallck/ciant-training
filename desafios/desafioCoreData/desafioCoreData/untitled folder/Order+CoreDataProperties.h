//
//  Order+CoreDataProperties.h
//  desafioCoreData
//
//  Created by Wallace Goncalves de Oliveira on 11/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Order.h"

NS_ASSUME_NONNULL_BEGIN

@interface Order (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *orderDate;
@property (nullable, nonatomic, retain) NSNumber *totalPrice;
@property (nullable, nonatomic, retain) Client *client;
@property (nullable, nonatomic, retain) NSSet<OrderItem *> *orderItens;

@end

@interface Order (CoreDataGeneratedAccessors)

- (void)addOrderItensObject:(OrderItem *)value;
- (void)removeOrderItensObject:(OrderItem *)value;
- (void)addOrderItens:(NSSet<OrderItem *> *)values;
- (void)removeOrderItens:(NSSet<OrderItem *> *)values;

@end

NS_ASSUME_NONNULL_END
