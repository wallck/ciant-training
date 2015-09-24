//
//  CoreDataSpecieController.m
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 17/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "CoreDataSpecieController.h"

@implementation CoreDataSpecieController

+(NSArray<Specie *> *)loadByContext:(NSManagedObjectContext *)context {
    NSMutableArray<Specie *> *array =[NSMutableArray array];
    
    if (![self hasAnyOnContext:context]) {
        for (NSUInteger i = 1; i < NSIntegerMax; i++) {
            NSArray<Specie *> *inner = [self load:[Specie URL_APIWithPage:@(i)] byContext:context];
            if (inner.count == 0) break;
            [array addObjectsFromArray:inner];
        }
    } else
        [array addObjectsFromArray: [self getAllOnContext:context]];
    
    return array;
}
+(NSArray<Specie *> *)load:(NSString *)URL byContext:(NSManagedObjectContext *)context {
    NSMutableArray<Specie *> *array =[NSMutableArray array];
    
    if ([URL containsString:super.urlPageKey]) {
        NSDictionary *dic = [JsonHelper getJSONDictionary:URL];
        if (!dic) return array;
        
        NSArray *inner = [dic objectForKey:super.jsonResultsKey];
        
        for (NSDictionary *objDic in inner) {
            NSString *url = [objDic objectForKey:super.jsonUrlKey];
            
            if (![self exists:url onContext:context]) {
                Specie *obj = [self newWithJSON:objDic onContext:context];
                [array addObject:obj];
            }
        }
    } else {
        Specie *obj = [self getByURL:URL onContext:context];
        
        if (!obj) {
            NSDictionary *dic = [JsonHelper getJSONDictionary:URL];
            if (!dic) return array;
            
            obj = [self newWithJSON:dic onContext:context];
        }
        
        [array addObject:obj];
    }
    
    return array;
}

+(Specie *)newWithJSON:(NSDictionary*)JSON onContext:(NSManagedObjectContext *)context {
    Specie *obj = [Specie newEntity:context];
    [obj fillWithJson:JSON];
    [self saveContext:context];
    return obj;
}

+(BOOL)hasAnyOnContext:(NSManagedObjectContext *)context {
    return [self hasEntity:[Specie entityName] withURL:nil onContext:context];
}
+(NSArray<Specie*>*)getAllOnContext:(NSManagedObjectContext *)context {
    return [self getAllEntities:[Specie entityName] onContext:context];
}

+(BOOL)exists:(NSString*)URL onContext:(NSManagedObjectContext *)context {
    return [self hasEntity:[Specie entityName] withURL:URL onContext:context];
}
+(Specie *)getByURL:(NSString*)URL onContext:(NSManagedObjectContext *)context {
    return [self getEntity:[Specie entityName] byURL:URL onContext:context];
}


@end