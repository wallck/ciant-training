//
//  CoreDataVehicleController.h
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 17/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "CoreDataManager.h"

@interface CoreDataVehicleController : CoreDataManager

+(NSArray<Vehicle *> *)loadByContext:(NSManagedObjectContext *)context;
+(NSArray<Vehicle *> *)load:(NSString *)URL byContext:(NSManagedObjectContext *)context;

+(Vehicle *)newWithJSON:(NSDictionary*)JSON onContext:(NSManagedObjectContext *)context;

+(BOOL)hasAnyOnContext:(NSManagedObjectContext *)context;
+(NSArray<Vehicle*>*)getAllOnContext:(NSManagedObjectContext *)context;

+(BOOL)exists:(NSString*)URL onContext:(NSManagedObjectContext *)context;
+(Vehicle *)getByURL:(NSString*)URL onContext:(NSManagedObjectContext *)context;

@end
