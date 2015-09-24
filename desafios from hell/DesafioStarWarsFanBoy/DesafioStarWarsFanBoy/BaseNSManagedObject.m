//
//  BaseNSManagedObject.m
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 16/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "BaseNSManagedObject.h"
#import <objc/objc-runtime.h>

@implementation BaseNSManagedObject

@synthesize lastSeen;

-(id)getPropertyValue:(NSString*)propertyName {
    
    if(class_getProperty([self class], propertyName.UTF8String))
    {
        id value = [self valueForKey:[NSString stringWithUTF8String:propertyName.UTF8String]];
        return value;
    }
    
    return nil;
}

-(void)setDisplayName:(NSString *)displayName {
    _displayName = displayName;
}
-(NSString *)displayName {
    return _displayName;
}

+(NSString *)entityName {
    return NSStringFromClass(self);
}

+(instancetype)newEntity:(NSManagedObjectContext *)context {
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:[self entityName]
                                   inManagedObjectContext:context];
    
    return [[self alloc]
            initWithEntity:entity
            insertIntoManagedObjectContext:context];
}

+(NSString *)URL_APIWithPage:(NSNumber *)page {
    return [NSString stringWithFormat:[self URL_API], page];
}

+(NSString *)URL_API {
    return @"http://swapi.co/api/";
}

+(NSMutableArray *)allFields {
    return [NSMutableArray array];
}
-(NSMutableArray *)allFields {
    return [BaseNSManagedObject allFields];
}

-(void)fillWithJson:(NSDictionary *)json {
    
}

-(void)updateLastSeen {
    
}

@end
