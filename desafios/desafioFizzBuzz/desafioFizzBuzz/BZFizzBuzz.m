//
//  FBFizzBuzz.m
//  desafioFizzBuzz
//
//  Created by Wallace Goncalves de Oliveira on 21/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "BZFizzBuzz.h"

@implementation BZFizzBuzz

+(instancetype)newWithTotal:(int)total {
    return [[BZFizzBuzz alloc] initWithTotal:total];
}

-(instancetype)init {
    return [self initWithTotal: 1];
}

-(instancetype)initWithTotal:(int) total {
    self = [super init];
    
    if (self) {
        _total = total;
    }
    
    return self;
}

-(NSArray *)jogar {
    
    NSMutableArray* array = [NSMutableArray array];
    
    for (int i = 1; i <= _total; i++) {
        NSMutableString *fb = [NSMutableString string];
        
        if (i % 3 == 0)
            [fb appendString:@"Fizz"];
        
        if (i % 5 == 0)
            [fb appendString:@"Buzz"];
        
        if ([fb isEqual:@""])
            [array addObject:[NSNumber numberWithInt:i]];
        else
            [array addObject:fb];
    }
    
    return array;
}

-(void)print {
    
    NSArray *array = [self jogar];
    
    for (id element in array) {
        
        if ([element isKindOfClass:[NSString class]]) {
            NSString *es = (NSString*)element;
            printf("%s\n", [es cStringUsingEncoding:NSUTF8StringEncoding]);
        } else {
            NSNumber *en = (NSNumber*)element;
            printf("%d\n", [en intValue]);
        }
    }
}

@end