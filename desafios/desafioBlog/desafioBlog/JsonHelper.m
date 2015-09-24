//
//  JsonHelper.m
//  desafioBlog
//
//  Created by Wallace Goncalves de Oliveira on 04/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "JsonHelper.h"

@implementation JsonHelper

+(NSArray*)getArrayOfJson:(NSString*)url {
    NSURL *nurl = [NSURL URLWithString:url];
    NSData *data = [NSData dataWithContentsOfURL:nurl];
    NSError *error = nil;
    NSArray *array = [NSJSONSerialization
                      JSONObjectWithData:data
                      options:0
                      error:&error];
    if (error)
        NSLog(@"Error to get Array Of Jsons: %@", error);
    
    return array;
}

@end
