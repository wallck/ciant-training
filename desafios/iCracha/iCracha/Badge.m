//
//  Badge.m
//  iCracha
//
//  Created by Wallace Goncalves de Oliveira on 25/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Badge.h"

@implementation Badge

+(instancetype)newWithName:(NSString *)name andPicture:(UIImage *)picture {
    return [[Badge alloc] initWithName:name andPicture:picture];
}

-(instancetype)init {
    return [self initWithName:@"" andPicture:nil];
}

-(instancetype)initWithName:(NSString*)name andPicture:(UIImage*)picture {
    self = [super init];
    
    if (self) {
        _name = name;
        _picture = picture;
    }
    
    return self;
}


@end
