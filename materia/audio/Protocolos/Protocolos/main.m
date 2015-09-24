//
//  main.m
//  Protocolos
//
//  Created by Marcos Trovilho on 21/08/15.
//  Copyright (c) 2015 Marcos Trovilho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pessoa.h"
#import "Fabrica.h"

void testeFabrica() {
    Fabrica *fabrica = [Fabrica new];
    
    Maquina *maquinas[2];
    maquinas[0] = [Maquina new];
    
    maquinas[1] = [[Maquina alloc] initWithDelegate:fabrica];
    
    [maquinas[0] comecar];
    [maquinas[1] comecar];
    
    maquinas[0].delegate = fabrica;
    
    [maquinas[0] terminar];
    [maquinas[1] terminar];
}

void testePessoa() {
    Pessoa *p = [Pessoa new];
    [p jogarTenis];
    
    // Cuidado, precisamos checar os metodos opcionais antes de chama-los
    if ([p respondsToSelector:@selector(nadarBorboleta)]) {
        [p nadarBorboleta];
    }
    
    // curiosidade :)
    // podemos chamar metodos privados via:
    // [p performSelector:@selector(_apiPrivada) withObject:nil];
    
    // tambem podemos checar se o objeto conforma com um protocolo
    if ([p conformsToProtocol:@protocol(Tenista)]) {
        printf("Conforma com o protocolo Tenista :)\n");
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //testePessoa();
        testeFabrica();
    }
    
    return 0;
}
