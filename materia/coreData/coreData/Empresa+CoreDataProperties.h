//
//  Empresa+CoreDataProperties.h
//  coreData
//
//  Created by Wallace Goncalves de Oliveira on 11/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Empresa.h"

NS_ASSUME_NONNULL_BEGIN

@interface Empresa (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *nomeFantasia;
@property (nullable, nonatomic, retain) NSSet<Pessoa *> *funcionarios;

@end

@interface Empresa (CoreDataGeneratedAccessors)

- (void)addFuncionariosObject:(Pessoa *)value;
- (void)removeFuncionariosObject:(Pessoa *)value;
- (void)addFuncionarios:(NSSet<Pessoa *> *)values;
- (void)removeFuncionarios:(NSSet<Pessoa *> *)values;

@end

NS_ASSUME_NONNULL_END
