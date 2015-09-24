//
//  Arrays.m
//  classesFoundation
//
//  Created by Wallace Goncalves de Oliveira on 20/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Arrays.h"

@implementation Arrays

+(void)testesArray {

    NSArray *coisas = @[ @"Teste", @4, @NO ];
    
    // Array -> String
    NSArray *letras = @[ @"C", @"I", @"&", @"T"];
    NSString *nome = [letras componentsJoinedByString:@""];
    
    // Contains
    BOOL tem = [coisas containsObject:@5];
    
    // Count
    NSUInteger total1 = [coisas count];
    NSUInteger total2 = coisas.count;
    
    // Indices
    id elemento = [coisas objectAtIndex:2];
    elemento = coisas[2];
    
    // Se não existir, retornará NSNotFound
    NSUInteger indice = [coisas indexOfObject:@"Total"];
    
    // Primeiro e Último
    id primeiro = [coisas firstObject];
    id ultimo = [coisas lastObject];
    
    // Loops
    for (id elemento in coisas) {
        NSLog(@"%@", elemento);
    }
    
    // Pseudo Generics
    // NOTA: Xcode 7+ (em breve...)
    // NSArray<NSString> *teste = @[];
}

+(void)testesArrayMutavel {
    
    NSMutableArray *coisas = [NSMutableArray array];
    [coisas addObject:@"Aee"];
    [coisas addObject:@":)"];
    
    [coisas removeObjectAtIndex:1];
    [coisas removeObject:@"Teste"];
    
    // Não pode fazer um insert fora do tamanho atual do array
    [coisas insertObject:@"Olá" atIndex:0];
    
    // Troca os elementos dos indices
    [coisas exchangeObjectAtIndex:0 withObjectAtIndex:1];
    
    // Filtro
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self LIKE 'Teste%'"];
    [coisas filteredArrayUsingPredicate:predicate];
}

@end