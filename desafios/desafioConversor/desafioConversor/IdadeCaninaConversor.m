//
//  IdadeCaninaConversor.m
//  desafioConversor
//
//  Created by Wallace Goncalves de Oliveira on 26/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "IdadeCaninaConversor.h"

@implementation IdadeCaninaConversor

+(instancetype)newComIdadeCanina:(NSNumber *)idade {
    return [[IdadeCaninaConversor alloc] initComIdadeCanina:idade];
}

-(instancetype)init {
    return [self initComIdadeCanina:@0];
}

-(instancetype)initComIdadeCanina:(NSNumber *)idade {
    self = [super init];
    
    if (self) {
        super.valor = idade;
    }
    
    return self;
}

-(NSNumber *)paraIdadeHumana {
    int idade = super.valor.intValue;
    return [NSNumber numberWithInt: idade <= 2 ? idade * 10 : ((idade - 2) * 4) + 20];
}

@end
