//
//  CoreDataSpecieController.h
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 17/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "CoreDataManager.h"

@interface CoreDataSpecieController : CoreDataManager

+(NSArray<Specie *> *)loadByContext:(NSManagedObjectContext *)context;
+(NSArray<Specie *> *)load:(NSString *)URL byContext:(NSManagedObjectContext *)context;

+(Specie *)newWithJSON:(NSDictionary*)JSON onContext:(NSManagedObjectContext *)context;

+(BOOL)hasAnyOnContext:(NSManagedObjectContext *)context;
+(NSArray<Specie*>*)getAllOnContext:(NSManagedObjectContext *)context;

+(BOOL)exists:(NSString*)URL onContext:(NSManagedObjectContext *)context;
+(Specie *)getByURL:(NSString*)URL onContext:(NSManagedObjectContext *)context;

@end