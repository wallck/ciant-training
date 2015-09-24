//
//  Foca.m
//  desafioFizzBuzz
//
//  Created by Wallace Goncalves de Oliveira on 21/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "BZForca.h"

@implementation BZForca

+(instancetype)newComPalavra:(NSString*)palavra {
    return [[BZForca alloc] initWithPalavra:palavra];
}

-(instancetype)init {
    return [self initWithPalavra: @""];
}

-(instancetype)initWithPalavra:(NSString*) palavra {
    self = [super init];
    
    if (self) {
        _palavra = [palavra uppercaseString];
        _quantidadeDeVidas = 5;
        
        _palavraMascarada = [NSMutableString string];
        for (int i = 0; i < _palavra.length; i++) {
            [_palavraMascarada appendString:@"_"];
        }
    }
    
    return self;
}

-(BOOL)chute:(NSString*)letra {
    
    letra = [letra uppercaseString];
    BOOL encontrou = NO;
    
    printf("Chute: %s\t\t", [letra cStringUsingEncoding:NSUTF8StringEncoding]);
    
    for (int i = 0; i < _palavra.length; i++) {
        NSString *l = [_palavra substringWithRange:NSMakeRange(i, 1)];
        if ([letra isEqual:l]) {
            [_palavraMascarada replaceCharactersInRange:NSMakeRange(i, 1) withString:l];
            encontrou = YES;
        }
    }
    
    if (!encontrou)
        _quantidadeDeVidas--;
    
    return encontrou;
}

-(BOOL)ganhou {
    return [_palavra isEqual:_palavraMascarada];
}

-(void)printPalavraMascarada {
    printf("%s\t\tvidas:%d\n", [_palavraMascarada cStringUsingEncoding:NSUTF8StringEncoding], _quantidadeDeVidas);
}

@end
