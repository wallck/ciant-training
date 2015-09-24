//
//  main.m
//  desafio3
//
//  Created by Wallace Goncalves de Oliveira on 19/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>

#define TAMANHO_ARRAY 10

void calculoTabuada(int n, int *retorno);
BOOL validaCPF(char cpf[]);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int array[TAMANHO_ARRAY];
        calculoTabuada(4, array);
        
        for (int i = 0; i < TAMANHO_ARRAY; i++) {
            printf("%d ", array[i]);
        }

        printf("\n\n");
        
        char cpf[] = "07458722630";
        
        if (validaCPF(cpf))
            printf("CPF Válido!");
        else
            printf("CPF Inválido!");
    }
    return 0;
}

void calculoTabuada(int n, int *retorno) {
    for (int i = 0; i < TAMANHO_ARRAY; i++) {
        retorno[i] = (i + 1) * n;
    }
}

BOOL validaCPF(char cpf[]) {
    
    int digito1 = cpf[9] - '0';
    int digito2 = cpf[10] - '0';
    
    int primeiraConta[9];
    for(int primeiroIndex = 10, cpfIndex = 0; primeiroIndex >= 2; primeiroIndex--, cpfIndex++) {
        primeiraConta[cpfIndex] = (cpf[cpfIndex] - '0') * primeiroIndex;
    }
    
    int primeiraSoma = 0;
    for (int i = 0; i < 9; i++)
        primeiraSoma += primeiraConta[i];
    
    int primeiroDigito = primeiraSoma %= 11;
    primeiroDigito = primeiroDigito < 2 ? 0 : 11 - primeiroDigito;
    cpf[10] = toascii(primeiroDigito);
    
    int segundaConta[10];
    for(int segundoIndex = 11, cpfIndex = 0; segundoIndex >= 2; segundoIndex--, cpfIndex++)
        segundaConta[cpfIndex] = (cpf[cpfIndex] - '0') * segundoIndex;
    
    int segundaSoma = 0;
    for (int i = 0; i < 10; i++)
        segundaSoma += segundaConta[i];
    
    int segundoDigito = segundaSoma %= 11;
    segundoDigito = segundoDigito < 2 ? 0 : 11 - segundoDigito;
    cpf[10] = toascii(segundoDigito);
    
    if (primeiroDigito != digito1 || segundoDigito != digito2)
        return NO;
    
    return YES;
}