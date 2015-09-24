//
//  VolumeConversor.m
//  desafioConversor
//
//  Created by Wallace Goncalves de Oliveira on 26/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "VolumeConversor.h"

@implementation VolumeConversor

+(instancetype)newComValorEmLitros:(NSNumber *)valor {
    return [[VolumeConversor alloc] initComValorEmLitros:valor];
}

-(instancetype)init {
    return [self initComValorEmLitros:@0];
}

-(instancetype)initComValorEmLitros:(NSNumber *)valor {
    self = [super init];
    
    if (self) {
        super.valor = valor;
    }
    
    return self;
}

-(NSNumber *)paraGaloes {
    return [NSNumber numberWithDouble:self.valor.doubleValue * 3.78541178];
}

-(NSNumber *)paraMetroCubico {
    return [NSNumber numberWithDouble:self.valor.doubleValue / 1000];
}

-(NSNumber *)paraCentimetroCubico {
    return [NSNumber numberWithDouble:self.valor.doubleValue / 1000000];
}

@end
