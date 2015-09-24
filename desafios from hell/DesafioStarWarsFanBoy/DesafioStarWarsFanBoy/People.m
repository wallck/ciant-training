//
//  People.m
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 16/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "People.h"
#import "Planet.h"
#import "Vehicle.h"
#import "CoreDataFilmController.h"
#import "CoreDataPlanetController.h"
#import "CoreDataVehicleController.h"
#import "CoreDataStarshipController.h"
#import "CoreDataSpecieController.h"

#define URL_ENTITY_API      @"people/?page=%@"

#define JSON_NAME           @"name"
#define JSON_HEIGHT         @"height"
#define JSON_MASS           @"mass"
#define JSON_HAIR_COLOR     @"hair_color"
#define JSON_SKIN_COLOR     @"skin_color"
#define JSON_EYE_COLOR      @"eye_color"
#define JSON_BIRTH_YEAR     @"birth_year"
#define JSON_GENDER         @"gender"
#define JSON_HOMEWORLD      @"homeworld"
#define JSON_FILMS          @"films"
#define JSON_SPECIES        @"species"
#define JSON_VEHICLES       @"vehicles"
#define JSON_STARSHIPS      @"starships"
#define JSON_CREATED        @"created"
#define JSON_EDITED         @"edited"
#define JSON_URL            @"url"

@implementation People

-(NSString *)displayName {
    return self.name;
}

+(NSString *)URL_API {
    NSString *baseAPI = [super URL_API];
    return [NSString stringWithFormat:@"%@%@", baseAPI, URL_ENTITY_API];
}

-(void)updateLastSeen {
    self.lastSeen = [NSDate new];
    [CoreDataManager saveContext:self.managedObjectContext];
}

+(NSMutableArray *)allFields {
    return (NSMutableArray*)@[
             JSON_NAME,
             JSON_HEIGHT,
             JSON_MASS,
             JSON_HAIR_COLOR,
             JSON_SKIN_COLOR,
             JSON_EYE_COLOR,
             JSON_BIRTH_YEAR,
             JSON_GENDER,
             JSON_HOMEWORLD,
             JSON_FILMS,
             JSON_SPECIES,
             JSON_VEHICLES,
             JSON_STARSHIPS,
             JSON_CREATED,
             JSON_EDITED,
             JSON_URL
            ];
}
-(NSMutableArray *)allFields {
    return [People allFields];
}

-(void)fillWithJson:(NSDictionary *)json {
    self.name =             [json objectForKey:JSON_NAME];
    self.height =           [JsonHelper convertStringToNumber:[json objectForKey:JSON_HEIGHT]];
    self.mass =             [JsonHelper convertStringToNumber:[json objectForKey:JSON_MASS]];
    self.hair_color =       [json objectForKey:JSON_HAIR_COLOR];
    self.skin_color =       [json objectForKey:JSON_SKIN_COLOR];
    self.eye_color =        [json objectForKey:JSON_EYE_COLOR];
    self.birth_year =       [json objectForKey:JSON_BIRTH_YEAR];
    self.gender =           [json objectForKey:JSON_GENDER];
    self.homeworldUrl =     [json objectForKey:JSON_HOMEWORLD];
    self.filmUrls =         (NSArray*)[json objectForKey:JSON_FILMS];
    self.specieUrls =       (NSArray*)[json objectForKey:JSON_SPECIES];
    self.vehicleUrls =      (NSArray*)[json objectForKey:JSON_VEHICLES];
    self.starshipUrls =     (NSArray*)[json objectForKey:JSON_STARSHIPS];
    self.url =              [json objectForKey:JSON_URL];
}

-(void)fillHomeWorld {
    NSArray *array = [CoreDataPlanetController load:self.homeworldUrl byContext:self.managedObjectContext];
    self.homeworld = [array firstObject];
}
-(void)fillFilms {
    NSMutableArray *array = [NSMutableArray array];
    for (NSString *url in self.filmUrls) {
        NSArray *inner = [CoreDataFilmController load:url byContext:self.managedObjectContext];
        [array addObjectsFromArray:inner];
    }
    for (id obj in array) [self addFilmsObject:obj];
}
-(void)fillVehicles {
    NSMutableArray *array = [NSMutableArray array];
    for (NSString *url in self.vehicleUrls) {
        NSArray *inner = [CoreDataVehicleController load:url byContext:self.managedObjectContext];
        [array addObjectsFromArray:inner];
    }
    for (id obj in array) [self addVehiclesObject:obj];
}
-(void)fillStarship {
    NSMutableArray *array = [NSMutableArray array];
    for (NSString *url in self.starshipUrls) {
        NSArray *inner = [CoreDataStarshipController load:url byContext:self.managedObjectContext];
        [array addObjectsFromArray:inner];
    }
    for (id obj in array) [self addStarshipsObject:obj];
}
-(void)fillSpecies {
    NSMutableArray *array = [NSMutableArray array];
    for (NSString *url in self.specieUrls) {
        NSArray *inner = [CoreDataSpecieController load:url byContext:self.managedObjectContext];
        [array addObjectsFromArray:inner];
    }
    for (id obj in array) [self addSpeciesObject:obj];
}

@end
