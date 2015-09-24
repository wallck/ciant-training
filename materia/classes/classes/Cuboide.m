//
//  Cuboide.m
//  classes
//
//  Created by Wallace Goncalves de Oliveira on 20/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Cuboide.h"

@interface Cuboide ()

@property (readwrite) double volume;

@end

@implementation Cuboide

-(instancetype)init {
    return [self initComLargura:0 eAltura:0 eProfundidade:0];
}

-(instancetype)initComLargura:(double)largura eAltura:(double)altura eProfundidade:(double)profundidade {
    self = [super init];
    
    if (self) {
        _largura = largura;
        _altura = altura;
        _profundidade = profundidade;
    }
    
    return self;
}

-(double)calcularVolume {
    [self setVolume: _largura * _altura * _profundidade];
    return _volume;
}

@end
