//
//  CoreDataFilmController.h
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 17/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "CoreDataManager.h"

@interface CoreDataFilmController : CoreDataManager

+(NSArray<Film *> *)loadByContext:(NSManagedObjectContext *)context;
+(NSArray<Film *> *)load:(NSString *)URL byContext:(NSManagedObjectContext *)context;

+(Film *)newWithJSON:(NSDictionary*)JSON onContext:(NSManagedObjectContext *)context;

+(BOOL)hasAnyOnContext:(NSManagedObjectContext *)context;
+(NSArray<Film*>*)getAllOnContext:(NSManagedObjectContext *)context;

+(BOOL)exists:(NSString*)URL onContext:(NSManagedObjectContext *)context;
+(Film *)getByURL:(NSString*)URL onContext:(NSManagedObjectContext *)context;

@end
