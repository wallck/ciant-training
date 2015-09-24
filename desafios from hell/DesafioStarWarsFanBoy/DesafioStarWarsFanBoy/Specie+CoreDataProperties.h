//
//  Specie+CoreDataProperties.h
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 18/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Specie.h"

NS_ASSUME_NONNULL_BEGIN

@interface Specie (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *average_height;
@property (nullable, nonatomic, retain) NSString *average_lifespan;
@property (nullable, nonatomic, retain) NSString *classification;
@property (nullable, nonatomic, retain) NSString *designation;
@property (nullable, nonatomic, retain) NSString *eye_colors;
@property (nullable, nonatomic, retain) id filmUrls;
@property (nullable, nonatomic, retain) NSString *hair_colors;
@property (nullable, nonatomic, retain) id homeworldUrl;
@property (nullable, nonatomic, retain) NSString *language;
@property (nullable, nonatomic, retain) NSDate *lastSeen;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) id peopleUrls;
@property (nullable, nonatomic, retain) NSString *skin_colors;
@property (nullable, nonatomic, retain) NSString *url;
@property (nullable, nonatomic, retain) NSSet<Film *> *films;
@property (nullable, nonatomic, retain) Planet *homeworld;
@property (nullable, nonatomic, retain) NSSet<People *> *people;

@end

@interface Specie (CoreDataGeneratedAccessors)

- (void)addFilmsObject:(Film *)value;
- (void)removeFilmsObject:(Film *)value;
- (void)addFilms:(NSSet<Film *> *)values;
- (void)removeFilms:(NSSet<Film *> *)values;

- (void)addPeopleObject:(People *)value;
- (void)removePeopleObject:(People *)value;
- (void)addPeople:(NSSet<People *> *)values;
- (void)removePeople:(NSSet<People *> *)values;

@end

NS_ASSUME_NONNULL_END
