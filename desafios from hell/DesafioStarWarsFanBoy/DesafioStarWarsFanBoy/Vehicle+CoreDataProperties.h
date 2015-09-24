//
//  Vehicle+CoreDataProperties.h
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 18/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Vehicle.h"

NS_ASSUME_NONNULL_BEGIN

@interface Vehicle (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *cargo_capacity;
@property (nullable, nonatomic, retain) NSString *consumables;
@property (nullable, nonatomic, retain) NSNumber *cost_in_credits;
@property (nullable, nonatomic, retain) NSNumber *crew;
@property (nullable, nonatomic, retain) id filmUrls;
@property (nullable, nonatomic, retain) NSDate *lastSeen;
@property (nullable, nonatomic, retain) NSNumber *length;
@property (nullable, nonatomic, retain) NSString *manufacturer;
@property (nullable, nonatomic, retain) NSNumber *max_atmosphering_speed;
@property (nullable, nonatomic, retain) NSString *model;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *passengers;
@property (nullable, nonatomic, retain) id pilotUrls;
@property (nullable, nonatomic, retain) NSString *url;
@property (nullable, nonatomic, retain) NSString *vehicle_class;
@property (nullable, nonatomic, retain) NSSet<Film *> *films;
@property (nullable, nonatomic, retain) NSSet<People *> *pilots;

@end

@interface Vehicle (CoreDataGeneratedAccessors)

- (void)addFilmsObject:(Film *)value;
- (void)removeFilmsObject:(Film *)value;
- (void)addFilms:(NSSet<Film *> *)values;
- (void)removeFilms:(NSSet<Film *> *)values;

- (void)addPilotsObject:(People *)value;
- (void)removePilotsObject:(People *)value;
- (void)addPilots:(NSSet<People *> *)values;
- (void)removePilots:(NSSet<People *> *)values;

@end

NS_ASSUME_NONNULL_END
