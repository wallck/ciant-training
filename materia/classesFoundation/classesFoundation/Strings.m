//
//  Strings.m
//  classesFoundation
//
//  Created by Wallace Goncalves de Oliveira on 20/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Strings.h"

@implementation Strings

+(void)testesStrings {
    
    // NSString
    NSString *texto = @"Meu texto";
    // Equivalente a
    NSString *outroTexto = [[NSString alloc] initWithString:@"Meu texto"];
    // Equivalente a Inicialização com string C
    NSString *stringC = [NSString stringWithCString:"Meu texto" encoding:NSUTF8StringEncoding];
    // Equivalente a
    NSString *outraStringC = [[NSString alloc] initWithCString:"Meu texto" encoding:NSUTF8StringEncoding];
    
    // String vazia
    NSString *textoVazio = [NSString string];
    // Equivalente a
    NSString *outroTextoVazio = @"";
    
    // Formatos
    NSString *textoFormatado = [NSString stringWithFormat:@"%@", @6];
    
    // Capitalização
    texto = [texto lowercaseString];
    texto = [texto uppercaseString];
    texto = [texto capitalizedString];
    
    // String para Array
    NSArray *letras = [texto componentsSeparatedByString:@" "];
    
    // Conversões
    int intValue = [@"1" intValue];
    NSInteger integerValue = [@"1" integerValue];
    double doubleValue = [@"2.5" doubleValue];
    float floatValue = [@"5.3" floatValue];
    
    // Igualdade
    // Não tem problema utiliar isEqual, isEqualTo ou isEqualToString para NSString
    BOOL igual = [@"ABC" isEqual:@"ABC"];
    
    // Tamanho
    NSUInteger tamanho1 = @"Meu Texto ... ".length;
    NSUInteger tamango2 = [@"Meu Outro Texto ..." length];
    
    // Substring
    // troca
    [@"Texto" stringByReplacingCharactersInRange:NSMakeRange(2, 1) withString:@"s"];
    
    // cortas
    [@"1234567890" substringFromIndex:3];
}

void testesStringsMutaveis() {
    NSMutableString *stringMutavel = [NSMutableString string];
    [stringMutavel appendString:@"Minha String Mutavel"];
    [stringMutavel appendFormat:@"Teste %@", @YES];
    [stringMutavel replaceCharactersInRange:NSMakeRange(2, 1) withString:@"s"];
}

@end
