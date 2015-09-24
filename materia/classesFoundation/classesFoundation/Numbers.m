//
//  Numbers.m
//  classesFoundation
//
//  Created by Wallace Goncalves de Oliveira on 20/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Numbers.h"

@implementation Numbers

+(void)testesNumeros {
    
    NSNumber *numero = @1;
    // Equivalente a
    NSNumber *outroNumero = [NSNumber numberWithShort:4];
    // Equivalente a
    NSNumber *outroNumero2 = [NSNumber numberWithDouble:4.2];
    
    float f = numero.floatValue;
    // Equivalente a
    float f2 = [numero floatValue];
    
    BOOL b = numero.boolValue;
    // Equivalente a
    BOOL b2 = [numero boolValue];
    
    
}


@end
