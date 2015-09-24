//
//  Product+CoreDataProperties.h
//  desafioCoreData
//
//  Created by Wallace Goncalves de Oliveira on 11/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Product.h"

NS_ASSUME_NONNULL_BEGIN

@interface Product (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *details;
@property (nullable, nonatomic, retain) id picture;
@property (nullable, nonatomic, retain) NSNumber *salePrice;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *orderItens;

@end

@interface Product (CoreDataGeneratedAccessors)

- (void)addOrderItensObject:(NSManagedObject *)value;
- (void)removeOrderItensObject:(NSManagedObject *)value;
- (void)addOrderItens:(NSSet<NSManagedObject *> *)values;
- (void)removeOrderItens:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
