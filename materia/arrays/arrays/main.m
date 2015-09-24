//
//  main.m
//  arrays
//
//  Created by Wallace Goncalves de Oliveira on 19/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>

void trocarValores(int *valor1, int *valor2);
void preencherValor(NSString **texto);

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        // arrays
        
        int idades[4];
        idades[0] = 5;
        idades[3] = 16;
        
        float temperaturas[] = { 25.4, 56.3 };
        printf("%f\n\n", temperaturas[1]);
        
        // ponteiros
        
        int *pIdade;
        pIdade = &idades[2];
        
        int numero = 10;
        int *ponteiro = &numero;
        
        printf("Ponteiro é endereço de numero: %p\n", ponteiro);
        printf("Ponteiro aponta para valor numero: %d\n\n", *ponteiro);
        
        // exemplo com funções
        
        int numero1 = 5;
        int numero2 = 10;
        printf("N1: %d, N2: %d\n", numero1, numero2);
        
        trocarValores(&numero1, &numero2);
        printf("N1: %d, N2: %d\n\n", numero1, numero2);
        
        // ponteiro do ponteiro
        
        NSString *valor;
        preencherValor(&valor);
        printf("Valor: %s", [valor cStringUsingEncoding:NSUTF8StringEncoding]);
    }
    return 0;
}

void trocarValores(int *valor1, int *valor2) {
    int temp = *valor1;
    *valor1 = *valor2;
    *valor2 = temp;
}

void preencherValor(NSString **texto) {
    *texto = [NSString stringWithFormat:@"Valor Preenchido"];
}