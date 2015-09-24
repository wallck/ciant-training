//
//  CoreDataStarshipController.m
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 17/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "CoreDataStarshipController.h"

@implementation CoreDataStarshipController

+(NSArray<Starship *> *)loadByContext:(NSManagedObjectContext *)context {
    NSMutableArray<Starship *> *array =[NSMutableArray array];
    
    if (![self hasAnyOnContext:context]) {
        for (NSUInteger i = 1; i < NSIntegerMax; i++) {
            NSArray<Starship *> *inner = [self load:[Starship URL_APIWithPage:@(i)] byContext:context];
            if (inner.count == 0) break;
            [array addObjectsFromArray:inner];
        }
    } else
        [array addObjectsFromArray: [self getAllOnContext:context]];
    
    return array;
}
+(NSArray<Starship *> *)load:(NSString *)URL byContext:(NSManagedObjectContext *)context {
    NSMutableArray<Starship *> *array =[NSMutableArray array];
    
    if ([URL containsString:super.urlPageKey]) {
        NSDictionary *dic = [JsonHelper getJSONDictionary:URL];
        if (!dic) return array;
        
        NSArray *inner = [dic objectForKey:super.jsonResultsKey];
        
        for (NSDictionary *objDic in inner) {
            NSString *url = [objDic objectForKey:super.jsonUrlKey];
            
            if (![self exists:url onContext:context]) {
                Starship *obj = [self newWithJSON:objDic onContext:context];
                [array addObject:obj];
            }
        }
    } else {
        Starship *obj = [self getByURL:URL onContext:context];
        
        if (!obj) {
            NSDictionary *dic = [JsonHelper getJSONDictionary:URL];
            if (!dic) return array;
            
            obj = [self newWithJSON:dic onContext:context];
        }
        
        [array addObject:obj];
    }
    
    return array;
}

+(Starship *)newWithJSON:(NSDictionary*)JSON onContext:(NSManagedObjectContext *)context {
    Starship *obj = [Starship newEntity:context];
    [obj fillWithJson:JSON];
    [self saveContext:context];
    return obj;
}

+(BOOL)hasAnyOnContext:(NSManagedObjectContext *)context {
    return [self hasEntity:[Starship entityName] withURL:nil onContext:context];
}
+(NSArray<Starship*>*)getAllOnContext:(NSManagedObjectContext *)context {
    return [self getAllEntities:[Starship entityName] onContext:context];
}

+(BOOL)exists:(NSString*)URL onContext:(NSManagedObjectContext *)context {
    return [self hasEntity:[Starship entityName] withURL:URL onContext:context];
}
+(Starship *)getByURL:(NSString*)URL onContext:(NSManagedObjectContext *)context {
    return [self getEntity:[Starship entityName] byURL:URL onContext:context];
}

@end
