//
//  Contator.m
//  classes
//
//  Created by Wallace Goncalves de Oliveira on 20/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Contador.h"

@interface Contador ()

@property (readwrite) int valor;

@end

@implementation Contador

#pragma mark - Inicializadores

-(instancetype)init {
    return [self initComValor:0];
}

-(instancetype)initComValor:(int)valorInicial {
    self = [super init];
    
    if (self) {
        // inicializa o resto
        _valor = valorInicial;
        // NOTA: Recomenda-se não usar propriedades no init
    }
    
    return self;
}

// Sobrescrevendo Propriedades
/*
 -(void)setValor:(int)valor {
 // Sobrescreve aqui
 }
 
 -(int)valor {
 // Sobrescreve aqui
 return 0;
 }
 */

+(instancetype)newComInicio:(int)valorInicial {
    return [[Contador alloc] initComValor:valorInicial];
}

+(NSString *)descricao {
    return @"Classe Contador";
}

-(void)incrementar {
    _valor++;
}

-(void)incrementarEm:(int)incremento {
    _valor += incremento;
}

-(void)reset {
    _valor = 0;
}

@end
