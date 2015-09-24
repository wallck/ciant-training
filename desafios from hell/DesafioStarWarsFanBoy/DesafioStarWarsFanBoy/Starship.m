//
//  Starship.m
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 16/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Starship.h"
#import "CoreDataPeopleController.h"
#import "CoreDataFilmController.h"

#define URL_ENTITY_API                  @"starships/?page=%@"

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
#define JSON_HYPERDRIVE_RATING          @"hyperdrive_rating"
#define JSON_MGLT                       @"MGLT"
#define JSON_STARSHIP_CLASS             @"starship_class"
#define JSON_PILOTS                     @"pilots"
#define JSON_FILMS                      @"films"
#define JSON_CREATED                    @"created"
#define JSON_EDITED                     @"edited"
#define JSON_URL                        @"url"

@implementation Starship

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
             JSON_HYPERDRIVE_RATING,
             JSON_MGLT,
             JSON_STARSHIP_CLASS,
             JSON_PILOTS,
             JSON_FILMS,
             JSON_CREATED,
             JSON_EDITED,
             JSON_URL
            ];
}
-(NSMutableArray *)allFields {
    return [Starship allFields];
}

-(void)fillWithJson:(NSDictionary *)json {
    [super fillWithJson:json];
    
    self.hyperdrive_rating =            [JsonHelper convertStringToNumber:[json objectForKey:JSON_HYPERDRIVE_RATING]];
    self.mglt =                         [JsonHelper convertStringToNumber:[json objectForKey:JSON_MGLT]];
    self.starshipClass =                [json objectForKey:JSON_STARSHIP_CLASS];
}

-(void)setStarshipClass:(NSString *)starshipClass {
    self.vehicle_class = starshipClass;
}
-(NSString *)starshipClass {
    return self.vehicle_class;
}

@end
