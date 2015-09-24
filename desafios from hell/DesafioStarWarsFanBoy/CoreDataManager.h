//
//  CoreDataManager.h
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 16/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "JsonHelper.h"
#import "People.h"
#import "Planet.h"
#import "Film.h"
#import "Specie.h"
#import "Vehicle.h"
#import "Starship.h"

@interface CoreDataManager : NSObject

+(NSString*)urlPageKey;
+(NSString*)jsonResultsKey;
+(NSString*)jsonUrlKey;

+(BOOL)hasEntity:(NSString*)entityName withURL:(NSString*)URL onContext:(NSManagedObjectContext *)context;
+(NSArray*)getAllEntities:(NSString*)entityName onContext:(NSManagedObjectContext *)context;
+(NSArray*)getAllEntities:(NSString*)entityName orderBy:(NSString*)fieldName onContext:(NSManagedObjectContext *)context;
+(id)getEntity:(NSString*)entityName byURL:(NSString*)URL onContext:(NSManagedObjectContext *)context;
+(NSArray*)commitRequest:(NSFetchRequest*)request onContext:(NSManagedObjectContext *)context;
+(void)saveContext:(NSManagedObjectContext *)context;

@end
