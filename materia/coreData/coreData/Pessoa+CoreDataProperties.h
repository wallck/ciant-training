//
//  Pessoa+CoreDataProperties.h
//  coreData
//
//  Created by Wallace Goncalves de Oliveira on 11/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Pessoa.h"

NS_ASSUME_NONNULL_BEGIN

@interface Pessoa (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *nome;
@property (nullable, nonatomic, retain) id corPreferida;
@property (nullable, nonatomic, retain) NSNumber *idade;
@property (nullable, nonatomic, retain) NSManagedObject *empregador;

@end

NS_ASSUME_NONNULL_END
