//
//  Client+CoreDataProperties.h
//  desafioCoreData
//
//  Created by Wallace Goncalves de Oliveira on 11/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Client.h"

NS_ASSUME_NONNULL_BEGIN

@interface Client (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) id picture;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *orders;

@end

@interface Client (CoreDataGeneratedAccessors)

- (void)addOrdersObject:(NSManagedObject *)value;
- (void)removeOrdersObject:(NSManagedObject *)value;
- (void)addOrders:(NSSet<NSManagedObject *> *)values;
- (void)removeOrders:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
