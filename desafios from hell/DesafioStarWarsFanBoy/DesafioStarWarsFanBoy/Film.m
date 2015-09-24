//
//  Film.m
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 16/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Film.h"
#import "People.h"
#import "Planet.h"
#import "Vehicle.h"
#import "CoreDataManager.h"
#import "CoreDataPeopleController.h"
#import "CoreDataPlanetController.h"
#import "CoreDataVehicleController.h"
#import "CoreDataStarshipController.h"
#import "CoreDataSpecieController.h"

#define URL_ENTITY_API      @"films/?page=%@"

#define JSON_TITLE          @"title"
#define JSON_EPISODE_ID     @"episode_id"
#define JSON_OPENING_CRAWL  @"opening_crawl"
#define JSON_DIRECTOR       @"director"
#define JSON_PRODUCER       @"producer"
#define JSON_RELEASE_DATE   @"release_date"
#define JSON_CHARACTERS     @"characters"
#define JSON_PLANETS        @"planets"
#define JSON_STARSHIPS      @"starships"
#define JSON_VEHICLES       @"vehicles"
#define JSON_SPECIES        @"species"
#define JSON_CREATED        @"created"
#define JSON_EDITED         @"edited"
#define JSON_URL            @"url"

@implementation Film

-(NSString *)displayName {
    return [NSString stringWithFormat:@"%@ EP %@", self.title, [self convertToRoman: self.episode_id]];
}

-(NSString*)convertToRoman:(NSNumber *)num {
    switch (num.integerValue) {
        case 1: return @"I";
        case 2: return @"II";
        case 3: return @"III";
        case 4: return @"IV";
        case 5: return @"V";
        case 6: return @"VI";
        case 7: return @"VII";
    }
    
    return @"";
}

+(NSString *)URL_API {
    NSString *baseAPI = [super URL_API];
    return [NSString stringWithFormat:@"%@%@", baseAPI, URL_ENTITY_API];
}

+(NSMutableArray *)allFields {
    return (NSMutableArray*)@[
             JSON_TITLE,
             JSON_EPISODE_ID,
             JSON_OPENING_CRAWL,
             JSON_DIRECTOR,
             JSON_PRODUCER,
             JSON_RELEASE_DATE,
             JSON_CHARACTERS,
             JSON_PLANETS,
             JSON_STARSHIPS,
             JSON_VEHICLES,
             JSON_SPECIES,
             JSON_CREATED,
             JSON_EDITED,
             JSON_URL
            ];
}
-(NSMutableArray *)allFields {
    return [Film allFields];
}

-(void)updateLastSeen {
    self.lastSeen = [NSDate new];
    [CoreDataManager saveContext:self.managedObjectContext];
}

-(void)fillWithJson:(NSDictionary *)json {
    self.title =            [json objectForKey:JSON_TITLE];
    self.episode_id =       [json objectForKey:JSON_EPISODE_ID];
    self.opening_crawl =    [json objectForKey:JSON_OPENING_CRAWL];
    self.director =         [json objectForKey:JSON_DIRECTOR];
    self.producer =         [json objectForKey:JSON_PRODUCER];
    
    NSString *stringDate =  [json objectForKey:JSON_RELEASE_DATE];
    self.release_date =     [JsonHelper convertString:stringDate toFormatDate:@"yyyy-MM-dd"];
    
    self.characterUrls =    (NSArray*)[json objectForKey:JSON_CHARACTERS];
    self.planetUrls =       (NSArray*)[json objectForKey:JSON_PLANETS];
    self.starshipUrls =     (NSArray*)[json objectForKey:JSON_STARSHIPS];
    self.vehicleUrls =      (NSArray*)[json objectForKey:JSON_VEHICLES];
    self.specieUrls =       (NSArray*)[json objectForKey:JSON_SPECIES];
    self.url =              [json objectForKey:JSON_URL];
}

/*
-(NSSet<People *> *)characters {
    [self willAccessValueForKey:@"characters"];
    NSSet<People *> *list = [self primitiveValueForKey:@"characters"];
    [self didAccessValueForKey:@"characters"];
    if (list.count == 0)
        [self fillCharacters];
    return list;
}
*/

-(void)fillCharacters {
    NSMutableArray *array = [NSMutableArray array];
    for (NSString *url in self.characterUrls) {
        NSArray *inner = [CoreDataPeopleController load:url byContext:self.managedObjectContext];
        [array addObjectsFromArray:inner];
    }
    for (id obj in array) [self addCharactersObject:obj];
    [CoreDataManager saveContext:self.managedObjectContext];
}
-(void)fillPlanets {
    NSMutableArray *array = [NSMutableArray array];
    for (NSString *url in self.planetUrls) {
        NSArray *inner = [CoreDataPlanetController load:url byContext:self.managedObjectContext];
        [array addObjectsFromArray:inner];
    }
    for (id obj in array) [self addPlanetsObject:obj];
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
