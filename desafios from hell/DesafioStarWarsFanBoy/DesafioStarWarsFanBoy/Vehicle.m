//
//  Vehicle.m
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 16/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Vehicle.h"
#import "CoreDataPeopleController.h"
#import "CoreDataFilmController.h"

#define URL_ENTITY_API                  @"vehicles/?page=%@"

#define JSON_NAME                       @"name"
#define JSON_MODEL                      @"model"
#define JSON_MANUFACTURER               @"manufacturer"
#define JSON_COST_IN_CREDITS            @"cost_in_credits"
#define JSON_LENGTH                     @"length"
#define JSON_MAX_ATMOSPHERING_SPEED     @"max_atmosphering_speed"
#define JSON_CREW                       @"crew"
#define JSON_PASSENGERS                 @"passengers"
#define JSON_CARGO_CAPACITY             @"cargo_capacity"
#define JSON_CONSUMABLES                @"consumables"
#define JSON_VEHICLE_CLASS              @"vehicle_class"
#define JSON_PILOTS                     @"pilots"
#define JSON_FILMS                      @"films"
#define JSON_CREATED                    @"created"
#define JSON_EDITED                     @"edited"
#define JSON_URL                        @"url"

@implementation Vehicle

-(NSString *)displayName {
    return [NSString stringWithFormat:@"%@ (%@)", self.name, self.model];
}

+(NSString *)URL_API {
    NSString *baseAPI = [super URL_API];
    return [NSString stringWithFormat:@"%@%@", baseAPI, URL_ENTITY_API];
}

+(NSMutableArray *)allFields {
    return (NSMutableArray*)@[
             JSON_NAME,
             JSON_MODEL,
             JSON_MANUFACTURER,
             JSON_COST_IN_CREDITS,
             JSON_LENGTH,
             JSON_MAX_ATMOSPHERING_SPEED,
             JSON_CREW,
             JSON_PASSENGERS,
             JSON_CARGO_CAPACITY,
             JSON_CONSUMABLES,
             JSON_VEHICLE_CLASS,
             JSON_PILOTS,
             JSON_FILMS,
             JSON_CREATED,
             JSON_EDITED,
             JSON_URL
            ];
}
-(NSMutableArray *)allFields {
    return [Vehicle allFields];
}

-(void)updateLastSeen {
    self.lastSeen = [NSDate new];
    [CoreDataManager saveContext:self.managedObjectContext];
}

-(void)fillWithJson:(NSDictionary *)json {
    self.name =                         [json objectForKey:JSON_NAME];
    self.model =                        [json objectForKey:JSON_MODEL];
    self.manufacturer =                 [json objectForKey:JSON_MANUFACTURER];
    self.cost_in_credits =              [JsonHelper convertStringToNumber:[json objectForKey:JSON_COST_IN_CREDITS]];
    self.length =                       [JsonHelper convertStringToNumber:[json objectForKey:JSON_LENGTH]];
    self.max_atmosphering_speed =       [JsonHelper convertStringToNumber:[json objectForKey:JSON_MAX_ATMOSPHERING_SPEED]];
    self.crew =                         [JsonHelper convertStringToNumber:[json objectForKey:JSON_CREW]];
    self.passengers =                   [JsonHelper convertStringToNumber:[json objectForKey:JSON_PASSENGERS]];
    self.cargo_capacity =               [JsonHelper convertStringToNumber:[json objectForKey:JSON_CARGO_CAPACITY]];
    self.consumables =                  [json objectForKey:JSON_CONSUMABLES];
    self.vehicle_class =                [json objectForKey:JSON_VEHICLE_CLASS];
    self.pilotUrls =                    (NSArray*)[json objectForKey:JSON_PILOTS];
    self.filmUrls =                     (NSArray*)[json objectForKey:JSON_FILMS];
    self.url =                          [json objectForKey:JSON_URL];
}

-(void)fillPilots {
    NSMutableArray *array = [NSMutableArray array];
    for (NSString *url in self.pilotUrls) {
        NSArray *inner = [CoreDataPeopleController load:url byContext:self.managedObjectContext];
        [array addObjectsFromArray:inner];
    }
    for (id obj in array) [self addPilotsObject:obj];
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
