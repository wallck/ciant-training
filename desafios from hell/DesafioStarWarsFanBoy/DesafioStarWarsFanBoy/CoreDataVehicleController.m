//
//  CoreDataVehicleController.m
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 17/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "CoreDataVehicleController.h"

@implementation CoreDataVehicleController

+(NSArray<Vehicle *> *)loadByContext:(NSManagedObjectContext *)context {
    NSMutableArray<Vehicle *> *array =[NSMutableArray array];
    
    if (![self hasAnyOnContext:context]) {
        for (NSUInteger i = 1; i < NSIntegerMax; i++) {
            NSArray<Vehicle *> *inner = [self load:[Vehicle URL_APIWithPage:@(i)] byContext:context];
            if (inner.count == 0) break;
            [array addObjectsFromArray:inner];
        }
    } else
        [array addObjectsFromArray: [self getAllOnContext:context]];
    
    return array;
}
+(NSArray<Vehicle *> *)load:(NSString *)URL byContext:(NSManagedObjectContext *)context {
    NSMutableArray<Vehicle *> *array =[NSMutableArray array];
    
    if ([URL containsString:super.urlPageKey]) {
        NSDictionary *dic = [JsonHelper getJSONDictionary:URL];
        if (!dic) return array;
        
        NSArray *inner = [dic objectForKey:super.jsonResultsKey];
        
        for (NSDictionary *objDic in inner) {
            NSString *url = [objDic objectForKey:super.jsonUrlKey];
            
            if (![self exists:url onContext:context]) {
                Vehicle *obj = [self newWithJSON:objDic onContext:context];
                [array addObject:obj];
            }
        }
    } else {
        Vehicle *obj = [self getByURL:URL onContext:context];
        
        if (!obj) {
            NSDictionary *dic = [JsonHelper getJSONDictionary:URL];
            if (!dic) return array;
            
            obj = [self newWithJSON:dic onContext:context];
        }
        
        [array addObject:obj];
    }
    
    return array;
}

+(Vehicle *)newWithJSON:(NSDictionary*)JSON onContext:(NSManagedObjectContext *)context {
    Vehicle *obj = [Vehicle newEntity:context];
    [obj fillWithJson:JSON];
    [self saveContext:context];
    return obj;
}

+(BOOL)hasAnyOnContext:(NSManagedObjectContext *)context {
    return [self hasEntity:[Vehicle entityName] withURL:nil onContext:context];
}
+(NSArray<Vehicle*>*)getAllOnContext:(NSManagedObjectContext *)context {
    return [self getAllEntities:[Vehicle entityName] onContext:context];
}

+(BOOL)exists:(NSString*)URL onContext:(NSManagedObjectContext *)context {
    return [self hasEntity:[Vehicle entityName] withURL:URL onContext:context];
}
+(Vehicle *)getByURL:(NSString*)URL onContext:(NSManagedObjectContext *)context {
    return [self getEntity:[Vehicle entityName] byURL:URL onContext:context];
}

@end
