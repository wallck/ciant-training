//
//  Planet.m
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 16/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Planet.h"
#import "CoreDataPeopleController.h"
#import "CoreDataFilmController.h"

#define URL_ENTITY_API          @"planets/?page=%@"

#define JSON_NAME               @"name"
#define JSON_ROTATION_PERIOD    @"rotation_period"
#define JSON_ORBITAL_PERIOD     @"orbital_period"
#define JSON_DIAMETER           @"diameter"
#define JSON_CLIMATE            @"climate"
#define JSON_GRAVITY            @"gravity"
#define JSON_TERRAIN            @"terrain"
#define JSON_SURFACE_WATER      @"surface_water"
#define JSON_POPULATION         @"population"
#define JSON_RESIDENTS          @"residents"
#define JSON_FILMS              @"films"
#define JSON_CREATED            @"created"
#define JSON_EDITED             @"edited"
#define JSON_URL                @"url"

@implementation Planet

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
             JSON_ROTATION_PERIOD,
             JSON_ORBITAL_PERIOD,
             JSON_DIAMETER,
             JSON_CLIMATE,
             JSON_GRAVITY,
             JSON_TERRAIN,
             JSON_SURFACE_WATER,
             JSON_POPULATION,
             JSON_RESIDENTS,
             JSON_FILMS,
             JSON_CREATED,
             JSON_EDITED,
             JSON_URL
            ];
}
-(NSMutableArray *)allFields {
    return [Planet allFields];
}

-(void)fillWithJson:(NSDictionary *)json {
    self.name =                 [json objectForKey:JSON_NAME];
    self.rotation_period =      [JsonHelper convertStringToNumber:[json objectForKey:JSON_ROTATION_PERIOD]];
    self.orbital_period =       [JsonHelper convertStringToNumber:[json objectForKey:JSON_ORBITAL_PERIOD]];
    self.diameter =             [JsonHelper convertStringToNumber:[json objectForKey:JSON_DIAMETER]];
    self.climate =              [json objectForKey:JSON_CLIMATE];
    self.gravity =              [json objectForKey:JSON_GRAVITY];
    self.terrain =              [json objectForKey:JSON_TERRAIN];
    self.surface_water =        [JsonHelper convertStringToNumber:[json objectForKey:JSON_SURFACE_WATER]];
    self.population =           [JsonHelper convertStringToNumber:[json objectForKey:JSON_POPULATION]];
    self.residentUrls =         (NSArray*)[json objectForKey:JSON_RESIDENTS];
    self.filmUrls =             (NSArray*)[json objectForKey:JSON_FILMS];
    self.url =                  [json objectForKey:JSON_URL];
}

-(void)fillResidents {
    NSMutableArray *array = [NSMutableArray array];
    for (NSString *url in self.residentUrls) {
        NSArray *inner = [CoreDataPeopleController load:url byContext:self.managedObjectContext];
        [array addObjectsFromArray:inner];
    }
    for (id obj in array) [self addResidentsObject:obj];
}
-(void)fillFilms {
    NSMutableArray *array = [NSMutableArray array];
    for (NSString *url in self.filmUrls) {
        NSArray *inner = [CoreDataFilmController load:url byContext:self.managedObjectContext];
        [array addObjectsFromArray:inner];
    }
    for (id obj in array) [self addFilmsObject:obj];
}

@end
