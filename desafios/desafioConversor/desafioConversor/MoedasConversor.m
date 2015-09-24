//
//  MoedasConversor.m
//  desafioConversor
//
//  Created by Wallace Goncalves de Oliveira on 26/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "MoedasConversor.h"

@implementation MoedasConversor

+(instancetype)newComValorEmReais:(NSNumber *)valor {
    return [[MoedasConversor alloc] initComValorEmReais:valor];
}

-(instancetype)init {
    return [self initComValorEmReais:@0];
}

-(instancetype)initComValorEmReais:(NSNumber *)valor {
    self = [super init];
    
    if (self) {
        super.valor = valor;
    }
    
    return self;
}

-(NSNumber *)paraDollar {
    return [NSNumber numberWithDouble:self.valor.doubleValue * 3.7];
}

-(NSNumber *)paraEuro {
    return [NSNumber numberWithDouble:self.valor.doubleValue * 4];
}

-(NSNumber *)paraLibra {
    return [NSNumber numberWithDouble:self.valor.doubleValue * 5];
}

@end
