//
//  JsonHelper.h
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 16/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonHelper : NSObject

+(NSArray*)getJSONArray:(NSString*)url;
+(NSDictionary*)getJSONDictionary:(NSString*)url;

+(NSDate*)convertString:(NSString*)stringDate toFormatDate:(NSString*)format;
+(NSString*)convertDate:(NSDate*)date toFormatString:(NSString*)format;
+(NSNumber*)convertStringToNumber:(NSString*)text;

@end
