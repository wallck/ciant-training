//
//  Starship+CoreDataProperties.h
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 18/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Starship.h"

NS_ASSUME_NONNULL_BEGIN

@interface Starship (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *hyperdrive_rating;
@property (nullable, nonatomic, retain) NSNumber *mglt;
@property (nullable, nonatomic, retain) NSString *starship_class;
@property (nullable, nonatomic, retain) NSSet<Film *> *starshipFilms;
@property (nullable, nonatomic, retain) NSSet<People *> *starshipPilots;

@end

@interface Starship (CoreDataGeneratedAccessors)

- (void)addStarshipFilmsObject:(Film *)value;
- (void)removeStarshipFilmsObject:(Film *)value;
- (void)addStarshipFilms:(NSSet<Film *> *)values;
- (void)removeStarshipFilms:(NSSet<Film *> *)values;

- (void)addStarshipPilotsObject:(People *)value;
- (void)removeStarshipPilotsObject:(People *)value;
- (void)addStarshipPilots:(NSSet<People *> *)values;
- (void)removeStarshipPilots:(NSSet<People *> *)values;

@end

NS_ASSUME_NONNULL_END
