//
//  Employee.m
//  iCracha
//
//  Created by Wallace Goncalves de Oliveira on 25/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Employee.h"
#import "Badge.h"

@implementation Employee

+(instancetype)newWithName:(NSString *)name workPlace:(NSString*)workPlace salary:(NSNumber *)salary biography:(NSString *)biography {
    return [[Employee alloc] initWithName:name workPlace:workPlace salary:salary biography:biography];
}

-(instancetype)init {
    return [self initWithName:@"" workPlace:@"" salary:@0 biography:@""];
}

-(instancetype)initWithName:(NSString*)name workPlace:(NSString*)workPlace salary:(NSNumber*)salary biography:(NSString*)biography {
    self = [super init];
    
    if (self) {
        super.name = name;
        _workPlace = workPlace;
        _salary = salary;
        _biography = biography;
        _badges = [NSMutableArray array];
    }
    
    return self;
}

-(void)addBadge:(NSString *)name andStoredImageName:(NSString *)storedImageName {
    UIImage *picture = [UIImage imageNamed:storedImageName];
    Badge *badge = [Badge newWithName:name andPicture:picture];
    [_badges addObject:badge];
}

-(void)setPictureByStoredImageName:(NSString *)storedImageName {
    UIImage *picture = [UIImage imageNamed:storedImageName];
    self.picture = picture;
}


@end
