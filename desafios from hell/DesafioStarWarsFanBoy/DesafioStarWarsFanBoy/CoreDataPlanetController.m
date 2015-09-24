//
//  CoreDataPlanetController.m
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 17/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "CoreDataPlanetController.h"

@implementation CoreDataPlanetController

+(NSArray<Planet *> *)loadByContext:(NSManagedObjectContext *)context {
    NSMutableArray<Planet *> *array =[NSMutableArray array];
    
    if (![self hasAnyOnContext:context]) {
        for (NSUInteger i = 1; i < NSIntegerMax; i++) {
            NSArray<Planet *> *inner = [self load:[Planet URL_APIWithPage:@(i)] byContext:context];
            if (inner.count == 0) break;
            [array addObjectsFromArray:inner];
        }
    } else
        [array addObjectsFromArray: [self getAllOnContext:context]];
    
    return array;
}
+(NSArray<Planet *> *)load:(NSString *)URL byContext:(NSManagedObjectContext *)context {
    NSMutableArray<Planet *> *array =[NSMutableArray array];
    
    if ([URL containsString:super.urlPageKey]) {
        NSDictionary *dic = [JsonHelper getJSONDictionary:URL];
        if (!dic) return array;
        
        NSArray *inner = [dic objectForKey:super.jsonResultsKey];
        
        for (NSDictionary *objDic in inner) {
            NSString *url = [objDic objectForKey:super.jsonUrlKey];
            
            if (![self exists:url onContext:context]) {
                Planet *obj = [self newWithJSON:objDic onContext:context];
                [array addObject:obj];
            }
        }
    } else {
        Planet *obj = [self getByURL:URL onContext:context];
        
        if (!obj) {
            NSDictionary *dic = [JsonHelper getJSONDictionary:URL];
            if (!dic) return array;
            
            obj = [self newWithJSON:dic onContext:context];
        }
        
        [array addObject:obj];
    }
    
    return array;
}

+(Planet *)newWithJSON:(NSDictionary*)JSON onContext:(NSManagedObjectContext *)context {
    Planet *obj = [Planet newEntity:context];
    [obj fillWithJson:JSON];
    [self saveContext:context];
    return obj;
}

+(BOOL)hasAnyOnContext:(NSManagedObjectContext *)context {
    return [self hasEntity:[Planet entityName] withURL:nil onContext:context];
}
+(NSArray<People*>*)getAllOnContext:(NSManagedObjectContext *)context {
    return [self getAllEntities:[Planet entityName] onContext:context];
}

+(BOOL)exists:(NSString*)URL onContext:(NSManagedObjectContext *)context {
    return [self hasEntity:[Planet entityName] withURL:URL onContext:context];
}
+(People *)getByURL:(NSString*)URL onContext:(NSManagedObjectContext *)context {
    return [self getEntity:[Planet entityName] byURL:URL onContext:context];
}

@end
