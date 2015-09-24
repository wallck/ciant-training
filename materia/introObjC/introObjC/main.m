//
//  main.m
//  introObjC
//
//  Created by Wallace Goncalves de Oliveira on 19/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pessoa.h"
#import "Animal.h"
#import "Mamifero.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Pessoa
        
        Pessoa *p = [[Pessoa alloc] init];

        [p setNome:@"Wallace Oliveira"];
        NSString *nome = [p nome];
        
        // ou
        p.nome = @"Wallace Oliveira";
        nome = p.nome;
        
        p.idade = 28;
        
        [p andar];
        [p setarAltura:5];
        [p andarPara:0 comPassos:35];
        
        // Mamifero
        
        Mamifero *cao = [[Mamifero alloc] init];
        
        // acessando variaveis sem @property
        cao->nome = @"Astolfo";
    }
    return 0;
}
