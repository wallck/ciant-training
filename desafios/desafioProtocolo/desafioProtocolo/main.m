//
//  main.m
//  desafioProtocolo
//
//  Created by Wallace Goncalves de Oliveira on 21/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//


// 2 protocolos
//   - Nomeavel
//   - Envelhecivel
// com propriedades de leitura
//   - nome
//   - idade
//
// classe Pessoa implementando os protocolos
//   criar algumas pessoas
// adiciona-las num array
//
// for-in com id<>
//    escrever no console o nome e idade
//
// protocolo MatrizDataSource
// metodos:
//   - quantidade de linhas
//   - quantidade de colunas
//
// classe Matriz com propriedades
//   - id<> dataSource
//   - metodo -create que prepara um vetor para armazenamento
//   - metodo -setValue:forLine:Column:

#import <Foundation/Foundation.h>
#import "BZPessoa.h"
#import "BZMatriz.h"

void printArrayPessoas(NSArray *array) {
    printf("PESSOAS:\n--------\n\n");
    for (BZPessoa *p in array) {
        printf("%s\t\t%d anos\n", [[p nome] cStringUsingEncoding:NSUTF8StringEncoding], p.idade);
    }
}

void primeiraParte() {
    
    BZPessoa *wallace = [BZPessoa newWithNome:@"Wallace" andIdade:29];
    BZPessoa *priscilla = [BZPessoa newWithNome:@"Priscilla" andIdade:24];
    BZPessoa *ellen = [BZPessoa newWithNome:@"Ellen" andIdade:22];
    BZPessoa *iasmini = [BZPessoa newWithNome:@"Iasmini" andIdade:21];
    
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:wallace];
    [array addObject:priscilla];
    [array addObject:ellen];
    [array addObject:iasmini];
    
    printArrayPessoas(array);
}

void segundaParte() {
    
    BZMatriz *matriz = [BZMatriz newWithRows:10 andColumns:10];
    [matriz setValue:@5 forLine:3 Column:2];
    [matriz setValue:@9 forLine:0 Column:0];
    [matriz setValue:@1 forLine:1 Column:0];
    [matriz setValue:@8 forLine:2 Column:0];
    [matriz setValue:@2 forLine:3 Column:0];
    [matriz setValue:@7 forLine:4 Column:0];
    [matriz setValue:@"BB" forLine:0 Column:1];
    
    BZDataSource *source = (BZDataSource*)matriz.source;
    
    for (int i = 0; i < source.quantidadeDeLinhas; i++) {
        for (int j = 0; j < source.quantidadeDeColunas; j++) {
            
            id element = [matriz getValueForLine:i Column:j];
            
            if ([element isKindOfClass:[NSString class]]) {
                NSString *es = (NSString*)element;
                printf("%s\t", [es cStringUsingEncoding:NSUTF8StringEncoding]);
            } else {
                NSNumber *en = (NSNumber*)element;
                printf("%d\t", [en intValue]);
            }
        }
        printf("\n");
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //primeiraParte();
        segundaParte();
    }
    return 0;
}
