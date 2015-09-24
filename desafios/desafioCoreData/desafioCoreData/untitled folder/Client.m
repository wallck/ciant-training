//
//  Client.m
//  desafioCoreData
//
//  Created by Wallace Goncalves de Oliveira on 11/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Client.h"

@implementation Client

// Insert code here to add functionality to your managed object subclass

+(NSString *)entityName {
    return @"Client";
}

+(instancetype)newEntity:(NSManagedObjectContext *)context {
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:[Client entityName]
                                   inManagedObjectContext:context];
    
    Client *obj = [[Client alloc]
                   initWithEntity:entity
                   insertIntoManagedObjectContext:context];
    
    return obj;
}

+(instancetype)firstByName:(NSString *)name context:(NSManagedObjectContext *)context {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:[Client entityName]];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", @"name", name];
    [request setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *clients = [context executeFetchRequest:request error:&error];
    
    if (clients.count == 0) return nil;
    
    Client *client = clients[0];
    return client;
}

@end
