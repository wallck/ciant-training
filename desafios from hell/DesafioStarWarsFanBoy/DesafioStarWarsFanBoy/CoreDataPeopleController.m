//
//  CoreDataPeopleController.m
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 17/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "CoreDataPeopleController.h"

@implementation CoreDataPeopleController

+(NSArray<People *> *)loadByContext:(NSManagedObjectContext *)context {
    NSMutableArray<People *> *array =[NSMutableArray array];
    
    if (![self hasAnyOnContext:context]) {
        for (NSUInteger i = 1; i < NSIntegerMax; i++) {
            NSArray<People *> *inner = [self load:[People URL_APIWithPage:@(i)] byContext:context];
            if (inner.count == 0) break;
            [array addObjectsFromArray:inner];
        }
    } else
        [array addObjectsFromArray: [self getAllOnContext:context]];
    
    return array;
}
+(NSArray<People *> *)load:(NSString *)URL byContext:(NSManagedObjectContext *)context {
    NSMutableArray<People *> *array =[NSMutableArray array];
    
    if ([URL containsString:super.urlPageKey]) {
        NSDictionary *dic = [JsonHelper getJSONDictionary:URL];
        if (!dic) return array;
        
        NSArray *inner = [dic objectForKey:super.jsonResultsKey];
        
        for (NSDictionary *objDic in inner) {
            NSString *url = [objDic objectForKey:super.jsonUrlKey];
            
            if (![self exists:url onContext:context]) {
                People *obj = [self newWithJSON:objDic onContext:context];
                [array addObject:obj];
            }
        }
    } else {    
        People *obj = [self getByURL:URL onContext:context];
        
        if (!obj) {
            NSDictionary *dic = [JsonHelper getJSONDictionary:URL];
            if (!dic) return array;
            
            obj = [self newWithJSON:dic onContext:context];
        }
        
        [array addObject:obj];
    }
    
    return array;
}

+(People *)newWithJSON:(NSDictionary*)JSON onContext:(NSManagedObjectContext *)context {
    People *obj = [People newEntity:context];
    [obj fillWithJson:JSON];
    [self saveContext:context];
    return obj;
}

+(BOOL)hasAnyOnContext:(NSManagedObjectContext *)context {
    return [self hasEntity:[People entityName] withURL:nil onContext:context];
}
+(NSArray<People*>*)getAllOnContext:(NSManagedObjectContext *)context {
    return [self getAllEntities:[People entityName] onContext:context];
}

+(BOOL)exists:(NSString*)URL onContext:(NSManagedObjectContext *)context {
    return [self hasEntity:[People entityName] withURL:URL onContext:context];
}
+(People *)getByURL:(NSString*)URL onContext:(NSManagedObjectContext *)context {
    return [self getEntity:[People entityName] byURL:URL onContext:context];
}

@end
