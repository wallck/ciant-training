//
//  MetricasConversor.m
//  desafioConversor
//
//  Created by Wallace Goncalves de Oliveira on 26/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "MetricasConversor.h"

@implementation MetricasConversor

+(instancetype)newComValorEmMetros:(NSNumber *)valor {
    return [[MetricasConversor alloc] initComValorEmMetros:valor];
}

-(instancetype)init {
    return [self initComValorEmMetros:@0];
}

-(instancetype)initComValorEmMetros:(NSNumber *)valor {
    self = [super init];
    
    if (self) {
        super.valor = valor;
    }
    
    return self;
}

-(NSNumber *)paraKilometros {
    return [NSNumber numberWithDouble: super.valor.doubleValue / 1000];
}
-(NSNumber *)paraCentimetros {
    return [NSNumber numberWithDouble: super.valor.doubleValue * 100];
}
-(NSNumber *)paraFeets {
    return [NSNumber numberWithDouble: self.valor.doubleValue * 3.28];
}
-(NSNumber *)paraYards {
    return [NSNumber numberWithDouble: self.valor.doubleValue * 0.9144];
}

@end
