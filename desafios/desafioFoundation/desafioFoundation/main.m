//
//  main.m
//  desafioFoundation
//
//  Created by Wallace Goncalves de Oliveira on 20/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pessoa.h"

NSArray* arrayToDictionary(NSMutableArray* pessoas);
void printDictionary(NSDictionary* dic);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
         
         Classe Pessoa
            propriedades:
                nome string
                idade number
                *total de letras do nome
                *iniciais do nome
                *ano de nascimento pode usar 2015
                **vogais do nome
                **consoantes do nome
            metodos
                descricao escreve nome e idade
                toDictionary devolve um dicionario com propriedades
         
         Fazer array de pessoas
         
         Funcao que devolve um array de dicionarios das pessoas
         
         */
        
        Pessoa *wallace = [[Pessoa alloc] initComNome:@"Wallace Oliveira" EAnoDeNascimento:@1986];
        Pessoa *priscilla = [[Pessoa alloc] initComNome:@"Priscilla Andrade" EAnoDeNascimento:@1990];
        Pessoa *iasmini = [[Pessoa alloc] initComNome:@"Iasmini Gonçalves" EAnoDeNascimento:@1992];
        Pessoa *ellen = [[Pessoa alloc] initComNome:@"Ellen Gonçalves de Oliveira" EAnoDeNascimento:@1991];
        
        NSMutableArray *pessoas = [NSMutableArray array];
        [pessoas addObject:wallace];
        [pessoas addObject:priscilla];
        [pessoas addObject:iasmini];
        [pessoas addObject:ellen];
        
        NSArray *pessoasDic = arrayToDictionary(pessoas);
        
        for (int i = 0; i < [pessoas count]; i++) {
            Pessoa *p = pessoas[i];
            NSString *descricao = p.descricao;
            printf("Pessoa: %s\n", [descricao cStringUsingEncoding:NSUTF8StringEncoding]);
            
            NSDictionary *dic= (NSDictionary*)pessoasDic[i];
            printDictionary(dic);
        }
    }
    return 0;
}

NSArray* arrayToDictionary(NSMutableArray* pessoas) {
    
    NSMutableArray *dicArray = [NSMutableArray array];
    
    for (Pessoa *pessoa in pessoas)
        [dicArray addObject:[pessoa toDictionary]];
    
    return dicArray;
}

void printDictionary(NSDictionary* dic) {
    
    NSArray* keys = [dic allKeys];
    printf("{\n");
    
    for (NSString *key in keys) {
        
        id valor = dic[key];
        NSString *valorString = [NSString stringWithFormat:@"%@", valor];
        
        printf("\t%s: %s\n",
               [key cStringUsingEncoding:NSUTF8StringEncoding],
               [valorString cStringUsingEncoding:NSUTF8StringEncoding]);
    }
    
    printf("}\n");
}
