//
//  People+CoreDataProperties.h
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 18/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "People.h"

NS_ASSUME_NONNULL_BEGIN

@interface People (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *birth_year;
@property (nullable, nonatomic, retain) NSString *eye_color;
@property (nullable, nonatomic, retain) id filmUrls;
@property (nullable, nonatomic, retain) NSString *gender;
@property (nullable, nonatomic, retain) NSString *hair_color;
@property (nullable, nonatomic, retain) NSNumber *height;
@property (nullable, nonatomic, retain) id homeworldUrl;
@property (nullable, nonatomic, retain) NSDate *lastSeen;
@property (nullable, nonatomic, retain) NSNumber *mass;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) id picture;
@property (nullable, nonatomic, retain) NSString *skin_color;
@property (nullable, nonatomic, retain) id specieUrls;
@property (nullable, nonatomic, retain) id starshipUrls;
@property (nullable, nonatomic, retain) NSString *url;
@property (nullable, nonatomic, retain) id vehicleUrls;
@property (nullable, nonatomic, retain) NSSet<Film *> *films;
@property (nullable, nonatomic, retain) Planet *homeworld;
@property (nullable, nonatomic, retain) NSSet<Specie *> *species;
@property (nullable, nonatomic, retain) NSSet<Starship *> *starships;
@property (nullable, nonatomic, retain) NSSet<Vehicle *> *vehicles;

@end

@interface People (CoreDataGeneratedAccessors)

- (void)addFilmsObject:(Film *)value;
- (void)removeFilmsObject:(Film *)value;
- (void)addFilms:(NSSet<Film *> *)values;
- (void)removeFilms:(NSSet<Film *> *)values;

- (void)addSpeciesObject:(Specie *)value;
- (void)removeSpeciesObject:(Specie *)value;
- (void)addSpecies:(NSSet<Specie *> *)values;
- (void)removeSpecies:(NSSet<Specie *> *)values;

- (void)addStarshipsObject:(Starship *)value;
- (void)removeStarshipsObject:(Starship *)value;
- (void)addStarships:(NSSet<Starship *> *)values;
- (void)removeStarships:(NSSet<Starship *> *)values;

- (void)addVehiclesObject:(Vehicle *)value;
- (void)removeVehiclesObject:(Vehicle *)value;
- (void)addVehicles:(NSSet<Vehicle *> *)values;
- (void)removeVehicles:(NSSet<Vehicle *> *)values;

@end

NS_ASSUME_NONNULL_END
