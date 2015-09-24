//
//  JsonHelper.m
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 16/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "JsonHelper.h"

@implementation JsonHelper

+(NSArray*)getJSONArray:(NSString*)url {
    NSArray *array = [self getJSONData:url];
    return array;
}

+(NSDictionary*)getJSONDictionary:(NSString*)url {
    NSDictionary *dic = [self getJSONData:url];
    return dic;
}

+(id)getJSONData:(NSString*)url {
    NSURL *nurl = [NSURL URLWithString:url];
    NSData *data = [NSData dataWithContentsOfURL:nurl];

    if (!data) return nil;
    
    NSError *error = nil;
    id jsonData = [NSJSONSerialization
                   JSONObjectWithData:data
                   options:0
                   error:&error];
    if (error)
        NSLog(@"Error to get Array Of Jsons: %@", error);
    
    return jsonData;
}

+(NSDate*)convertString:(NSString*)stringDate toFormatDate:(NSString*)format {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = format;
    return [dateFormatter dateFromString:stringDate];
}

+(NSString*)convertDate:(NSDate*)date toFormatString:(NSString*)format {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = format;
    return [dateFormatter stringFromDate:date];
}

+(NSNumber*)convertStringToNumber:(NSString*)text {
    double v = text.doubleValue;
    return [NSNumber numberWithDouble:v];
}

@end
