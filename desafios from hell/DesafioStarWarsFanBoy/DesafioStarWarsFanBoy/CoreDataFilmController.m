//
//  CoreDataFilmController.m
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 17/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "CoreDataFilmController.h"

@implementation CoreDataFilmController

+(NSArray<Film *> *)loadByContext:(NSManagedObjectContext *)context {
    NSMutableArray<Film *> *array =[NSMutableArray array];
    
    if (![self hasAnyOnContext:context]) {
        for (NSUInteger i = 1; i < NSIntegerMax; i++) {
            NSArray<Film *> *inner = [self load:[Film URL_APIWithPage:@(i)] byContext:context];
            if (inner.count == 0) break;
            [array addObjectsFromArray:inner];
        }
    } else
        [array addObjectsFromArray: [self getAllOnContext:context]];
    
    return array;
}
+(NSArray<Film *> *)load:(NSString *)URL byContext:(NSManagedObjectContext *)context {
    NSMutableArray<Film *> *array =[NSMutableArray array];
    
    if ([URL containsString:super.urlPageKey]) {
        NSDictionary *dic = [JsonHelper getJSONDictionary:URL];
        if (!dic) return array;
        
        NSArray *inner = [dic objectForKey:super.jsonResultsKey];
        
        for (NSDictionary *objDic in inner) {
            NSString *url = [objDic objectForKey:super.jsonUrlKey];
            
            if (![self exists:url onContext:context]) {
                Film *obj = [self newWithJSON:objDic onContext:context];
                [array addObject:obj];
            }
        }
    } else {
        Film *obj = [self getByURL:URL onContext:context];
        
        if (!obj) {
            NSDictionary *dic = [JsonHelper getJSONDictionary:URL];
            if (!dic) return array;
            
            obj = [self newWithJSON:dic onContext:context];
        }
        
        [array addObject:obj];
    }
    
    return array;
}

+(Film *)newWithJSON:(NSDictionary*)JSON onContext:(NSManagedObjectContext *)context {
    Film *obj = [Film newEntity:context];
    [obj fillWithJson:JSON];
    [self saveContext:context];
    return obj;
}

+(BOOL)hasAnyOnContext:(NSManagedObjectContext *)context {
    return [self hasEntity:[Film entityName] withURL:nil onContext:context];
}
+(NSArray<Film*>*)getAllOnContext:(NSManagedObjectContext *)context {
    return [self getAllEntities:[Film entityName] orderBy:@"episode_id" onContext:context];
}

+(BOOL)exists:(NSString*)URL onContext:(NSManagedObjectContext *)context {
    return [self hasEntity:[Film entityName] withURL:URL onContext:context];
}
+(Film *)getByURL:(NSString*)URL onContext:(NSManagedObjectContext *)context {
    return [self getEntity:[Film entityName] byURL:URL onContext:context];
}

@end
