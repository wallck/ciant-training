//
//  CoreDataManager.m
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 16/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "CoreDataManager.h"

#define URL_PAGE_KEY        @"?page="
#define JSON_RESULTS_KEY    @"results"
#define JSON_URL_KEY        @"url"

@implementation CoreDataManager

+(NSString*)urlPageKey { return URL_PAGE_KEY; }
+(NSString*)jsonResultsKey { return JSON_RESULTS_KEY; }
+(NSString*)jsonUrlKey { return JSON_URL_KEY; }

+(BOOL)hasEntity:(NSString*)entityName withURL:(NSString*)URL onContext:(NSManagedObjectContext *)context {
    id entity = [self getEntity:entityName byURL:URL onContext:context];
    return entity != nil;
}

+(NSArray*)getAllEntities:(NSString*)entityName onContext:(NSManagedObjectContext *)context {
    return [self getAllEntities:entityName orderBy:nil onContext:context];
}

+(NSArray *)getAllEntities:(NSString *)entityName orderBy:(NSString *)fieldName onContext:(NSManagedObjectContext *)context {
    NSFetchRequest *request = [[NSFetchRequest alloc]
                               initWithEntityName:entityName];
    
    if (fieldName) {
        NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:fieldName ascending:YES];
        [request setSortDescriptors:@[ sort ]];
    }
    
    NSArray *results = [self commitRequest:request onContext:context];
    
    return results;
}

+(id)getEntity:(NSString*)entityName byURL:(NSString*)URL onContext:(NSManagedObjectContext *)context {
    NSFetchRequest *request = [[NSFetchRequest alloc]
                               initWithEntityName:entityName];
    
    if (URL) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", JSON_URL_KEY, URL];
        [request setPredicate:predicate];
    }
    
    NSArray *results = [self commitRequest:request onContext:context];
    
    return results.count > 0 ? results[0] : nil;
}

+(NSArray*)commitRequest:(NSFetchRequest*)request onContext:(NSManagedObjectContext *)context {
    NSError *error = nil;
    NSArray *results = [context executeFetchRequest:request
                                              error:&error];
    
    return results;
}

#pragma mark - Core Data Support

+(void)saveContext:(NSManagedObjectContext *)context {
    NSManagedObjectContext *managedObjectContext = context;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
