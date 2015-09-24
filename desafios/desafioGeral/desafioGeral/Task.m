//
//  Task.m
//  desafioGeral
//
//  Created by Wallace Goncalves de Oliveira on 02/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Task.h"

@implementation Task

+(instancetype)newWithName:(NSString *)name {
    return [[Task alloc] initWithName:name];
}

-(instancetype)init {
    return [self initWithName:@""];
}

-(instancetype)initWithName:(NSString*)name {
    self = [super init];
    
    if (self) {
        _name = name;
        _status = YES;
    }
    
    return self;
}

@end
