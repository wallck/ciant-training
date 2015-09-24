//
//  Film+CoreDataProperties.h
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 18/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Film.h"

NS_ASSUME_NONNULL_BEGIN

@interface Film (CoreDataProperties)

@property (nullable, nonatomic, retain) id characterUrls;
@property (nullable, nonatomic, retain) NSString *director;
@property (nullable, nonatomic, retain) NSNumber *episode_id;
@property (nullable, nonatomic, retain) NSDate *lastSeen;
@property (nullable, nonatomic, retain) NSString *opening_crawl;
@property (nullable, nonatomic, retain) id planetUrls;
@property (nullable, nonatomic, retain) NSString *producer;
@property (nullable, nonatomic, retain) NSDate *release_date;
@property (nullable, nonatomic, retain) id specieUrls;
@property (nullable, nonatomic, retain) id starshipUrls;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *url;
@property (nullable, nonatomic, retain) id vehicleUrls;
@property (nullable, nonatomic, retain) NSSet<People *> *characters;
@property (nullable, nonatomic, retain) NSSet<Planet *> *planets;
@property (nullable, nonatomic, retain) NSSet<Specie *> *species;
@property (nullable, nonatomic, retain) NSSet<Starship *> *starships;
@property (nullable, nonatomic, retain) NSSet<Vehicle *> *vehicles;

@end

@interface Film (CoreDataGeneratedAccessors)

- (void)addCharactersObject:(People *)value;
- (void)removeCharactersObject:(People *)value;
- (void)addCharacters:(NSSet<People *> *)values;
- (void)removeCharacters:(NSSet<People *> *)values;

- (void)addPlanetsObject:(Planet *)value;
- (void)removePlanetsObject:(Planet *)value;
- (void)addPlanets:(NSSet<Planet *> *)values;
- (void)removePlanets:(NSSet<Planet *> *)values;

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
