//
//  Dicionarios.m
//  classesFoundation
//
//  Created by Wallace Goncalves de Oliveira on 20/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Dicionarios.h"

@implementation Dicionarios

+(void)testesDicionarios {
    
    NSDictionary *dicionario = @{
        @"Chave": @"Valor",
        @5: @YES
    };
    
    // Recuperando Valores
    id valor = dicionario[@"Chave"];
    // Equivalente a
    valor = [dicionario objectForKey:@"Chave"];
    
    // Listando Chaves
    NSArray *chaves = [dicionario allKeys];
    
    // Listando Valores
    NSArray *valores = [dicionario allValues];
    
    // Contagem
    NSUInteger total = dicionario.count;
}

+(void)testesDicionarioMutavel {
    
    NSMutableDictionary *d = [NSMutableDictionary dictionary];

    // Adicionando Chave/Valor
    [d setObject:@"Valor" forKey:@"Chave"];
    // Equivalente a
    d[@"OutraChave"] = @"Valor";
    d[@"OutraChave"] = @"Outro Valor";
    
    [d removeObjectForKey:@"Chave"];
}

@end
