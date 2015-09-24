//
//  IMC.m
//  desafioConversor
//
//  Created by Wallace Goncalves de Oliveira on 26/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "IMC.h"

@implementation IMC

+(NSNumber*)calcularComPeso:(NSNumber*)peso eAltura:(NSNumber*)altura {
    double imc = peso.doubleValue / altura.doubleValue * 2;
    return [NSNumber numberWithDouble:imc];
}

@end