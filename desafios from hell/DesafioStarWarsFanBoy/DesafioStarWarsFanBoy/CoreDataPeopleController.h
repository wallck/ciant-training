//
//  CoreDataPeopleController.h
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 17/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "CoreDataManager.h"

@interface CoreDataPeopleController : CoreDataManager

+(NSArray<People *> *)loadByContext:(NSManagedObjectContext *)context;
+(NSArray<People *> *)load:(NSString *)URL byContext:(NSManagedObjectContext *)context;

+(People *)newWithJSON:(NSDictionary*)JSON onContext:(NSManagedObjectContext *)context;

+(BOOL)hasAnyOnContext:(NSManagedObjectContext *)context;
+(NSArray<People*>*)getAllOnContext:(NSManagedObjectContext *)context;

+(BOOL)exists:(NSString*)URL onContext:(NSManagedObjectContext *)context;
+(People *)getByURL:(NSString*)URL onContext:(NSManagedObjectContext *)context;

@end
