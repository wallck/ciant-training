//
//  CoreDataStarshipController.h
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 17/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "CoreDataManager.h"

@interface CoreDataStarshipController : CoreDataManager

+(NSArray<Starship *> *)loadByContext:(NSManagedObjectContext *)context;
+(NSArray<Starship *> *)load:(NSString *)URL byContext:(NSManagedObjectContext *)context;

+(Starship *)newWithJSON:(NSDictionary*)JSON onContext:(NSManagedObjectContext *)context;

+(BOOL)hasAnyOnContext:(NSManagedObjectContext *)context;
+(NSArray<Starship*>*)getAllOnContext:(NSManagedObjectContext *)context;

+(BOOL)exists:(NSString*)URL onContext:(NSManagedObjectContext *)context;
+(Starship *)getByURL:(NSString*)URL onContext:(NSManagedObjectContext *)context;

@end
