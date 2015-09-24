//
//  Planet+CoreDataProperties.h
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 18/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Planet.h"

NS_ASSUME_NONNULL_BEGIN

@interface Planet (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *climate;
@property (nullable, nonatomic, retain) NSNumber *diameter;
@property (nullable, nonatomic, retain) id filmUrls;
@property (nullable, nonatomic, retain) NSString *gravity;
@property (nullable, nonatomic, retain) NSDate *lastSeen;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *orbital_period;
@property (nullable, nonatomic, retain) NSNumber *population;
@property (nullable, nonatomic, retain) id residentUrls;
@property (nullable, nonatomic, retain) NSNumber *rotation_period;
@property (nullable, nonatomic, retain) id specieUrls;
@property (nullable, nonatomic, retain) NSNumber *surface_water;
@property (nullable, nonatomic, retain) NSString *terrain;
@property (nullable, nonatomic, retain) NSString *url;
@property (nullable, nonatomic, retain) NSSet<Film *> *films;
@property (nullable, nonatomic, retain) NSSet<People *> *residents;
@property (nullable, nonatomic, retain) NSSet<Specie *> *species;

@end

@interface Planet (CoreDataGeneratedAccessors)

- (void)addFilmsObject:(Film *)value;
- (void)removeFilmsObject:(Film *)value;
- (void)addFilms:(NSSet<Film *> *)values;
- (void)removeFilms:(NSSet<Film *> *)values;

- (void)addResidentsObject:(People *)value;
- (void)removeResidentsObject:(People *)value;
- (void)addResidents:(NSSet<People *> *)values;
- (void)removeResidents:(NSSet<People *> *)values;

- (void)addSpeciesObject:(Specie *)value;
- (void)removeSpeciesObject:(Specie *)value;
- (void)addSpecies:(NSSet<Specie *> *)values;
- (void)removeSpecies:(NSSet<Specie *> *)values;

@end

NS_ASSUME_NONNULL_END
