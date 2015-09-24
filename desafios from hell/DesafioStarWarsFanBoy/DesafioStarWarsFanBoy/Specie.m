//
//  Specie.m
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 16/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Specie.h"
#import "Film.h"
#import "People.h"
#import "Planet.h"
#import "CoreDataPlanetController.h"
#import "CoreDataPeopleController.h"
#import "CoreDataFilmController.h"

#define URL_ENTITY_API          @"species/?page=%@"

#define JSON_NAME               @"name"
#define JSON_CLASSIFICATION     @"classification"
#define JSON_DESIGNATION        @"designation"
#define JSON_AVERAGE_HEIGHT     @"average_height"
#define JSON_SKIN_COLORS        @"skin_colors"
#define JSON_HAIR_COLORS        @"hair_colors"
#define JSON_EYE_COLORS         @"eye_colors"
#define JSON_AVERAGE_LIFESPAN   @"average_lifespan"
#define JSON_HOMEWORLD          @"homeworld"
#define JSON_LANGUAGE           @"language"
#define JSON_PEOPLE             @"people"
#define JSON_FILMS              @"films"
#define JSON_CREATED            @"created"
#define JSON_EDITED             @"edited"
#define JSON_URL                @"url"

@implementation Specie

-(NSString *)displayName {
    return self.name;
}

+(NSString *)URL_API {
    NSString *baseAPI = [super URL_API];
    return [NSString stringWithFormat:@"%@%@", baseAPI, URL_ENTITY_API];
}

+(NSMutableArray *)allFields {
    return (NSMutableArray*)@[
             JSON_NAME,
             JSON_CLASSIFICATION,
             JSON_DESIGNATION,
             JSON_AVERAGE_HEIGHT,
             JSON_SKIN_COLORS,
             JSON_HAIR_COLORS,
             JSON_EYE_COLORS,
             JSON_AVERAGE_LIFESPAN,
             JSON_HOMEWORLD,
             JSON_LANGUAGE,
             JSON_PEOPLE,
             JSON_FILMS,
             JSON_CREATED,
             JSON_EDITED,
             JSON_URL
            ];
}
-(NSMutableArray *)allFields {
    return [Specie allFields];
}

-(void)updateLastSeen {
    self.lastSeen = [NSDate new];
    [CoreDataManager saveContext:self.managedObjectContext];
}

-(void)fillWithJson:(NSDictionary *)json {
    self.name =                 [json objectForKey:JSON_NAME];
    self.classification =       [json objectForKey:JSON_CLASSIFICATION];
    self.designation =          [json objectForKey:JSON_DESIGNATION];
    self.average_height =       [JsonHelper convertStringToNumber:[json objectForKey:JSON_AVERAGE_HEIGHT]];
    self.skin_colors =          [json objectForKey:JSON_SKIN_COLORS];
    self.hair_colors =          [json objectForKey:JSON_HAIR_COLORS];
    self.eye_colors =           [json objectForKey:JSON_EYE_COLORS];
    self.average_lifespan =     [json objectForKey:JSON_AVERAGE_LIFESPAN];
    self.homeworldUrl =         [json objectForKey:JSON_HOMEWORLD];
    self.language =             [json objectForKey:JSON_LANGUAGE];
    self.peopleUrls =           (NSArray*)[json objectForKey:JSON_PEOPLE];
    self.filmUrls =             (NSArray*)[json objectForKey:JSON_FILMS];
    self.url =                  [json objectForKey:JSON_URL];
}

-(void)fillHomeWorld {
    NSArray *array = [CoreDataPlanetController load:self.homeworldUrl byContext:self.managedObjectContext];
    self.homeworld = [array firstObject];
}
-(void)fillPeople {
    NSMutableArray *array = [NSMutableArray array];
    for (NSString *url in self.peopleUrls) {
        NSArray *inner = [CoreDataPeopleController load:url byContext:self.managedObjectContext];
        [array addObjectsFromArray:inner];
    }
    for (id obj in array) [self addPeopleObject:obj];
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
