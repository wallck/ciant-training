//
//  BaseNSManagedObject.h
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 16/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface BaseNSManagedObject : NSManagedObject {
    NSString *_displayName;
}

@property NSString *displayName;
@property NSDate *lastSeen;

-(id)getPropertyValue:(NSString*)propertyName;

+(NSString*)entityName;
+(NSString*)URL_API;
+(NSString*)URL_APIWithPage:(NSNumber*)page;
+(NSMutableArray*)allFields;
-(NSMutableArray*)allFields;

-(void)updateLastSeen;
-(NSDate*)lastSeen;

+(instancetype)newEntity:(NSManagedObjectContext*)context;

-(void)fillWithJson:(NSDictionary*)json;

@end
