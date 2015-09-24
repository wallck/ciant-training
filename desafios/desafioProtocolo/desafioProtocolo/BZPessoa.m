//
//  BZPessoa.m
//  desafioProtocolo
//
//  Created by Wallace Goncalves de Oliveira on 21/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "BZPessoa.h"

@implementation BZPessoa

+(instancetype)newWithNome:(NSString *)nome andIdade:(int)idade {
    return [[BZPessoa alloc] initWithNome:nome andIdade:idade];
}

-(instancetype)init {
    return [self initWithNome:@"" andIdade:1];
}

-(instancetype)initWithNome:(NSString*)nome andIdade:(int)idade{
    self = [super init];
    
    if (self) {
        _nome = nome;
        _idade = idade;
    }
    
    return self;
}

@end
