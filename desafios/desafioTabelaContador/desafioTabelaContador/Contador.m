//
//  Contador.m
//  desafioTabelaContador
//
//  Created by Wallace Goncalves de Oliveira on 28/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Contador.h"

@implementation Contador

+(instancetype)new {
    Contador *contador = [[Contador alloc] init];
    return contador;
}

-(instancetype)init {
    self = [super init];
    
    if (self) {
        self.valor = @0;
        _numeros = [NSMutableArray array];
    }

    return self;
}

-(int)intValue {
    return self.valor.intValue;
}

-(void)__maisUm {
    self.valor = [NSNumber numberWithInt:self.intValue + 1];
}

-(void)__menosUm {
    self.valor = [NSNumber numberWithInt:self.intValue - 1];
}

-(void)__zerar {
    [_numeros insertObject:self.valor atIndex:0];
    self.valor = @0;
}

@end
