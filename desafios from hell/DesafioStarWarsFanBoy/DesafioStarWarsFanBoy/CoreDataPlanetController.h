//
//  CoreDataPlanetController.h
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 17/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "CoreDataManager.h"

@interface CoreDataPlanetController : CoreDataManager

+(NSArray<Planet *> *)loadByContext:(NSManagedObjectContext *)context;
+(NSArray<Planet *> *)load:(NSString *)URL byContext:(NSManagedObjectContext *)context;

+(Planet *)newWithJSON:(NSDictionary*)JSON onContext:(NSManagedObjectContext *)context;

+(BOOL)hasAnyOnContext:(NSManagedObjectContext *)context;
+(NSArray<Planet*>*)getAllOnContext:(NSManagedObjectContext *)context;

+(BOOL)exists:(NSString*)URL onContext:(NSManagedObjectContext *)context;
+(Planet *)getByURL:(NSString*)URL onContext:(NSManagedObjectContext *)context;

@end
