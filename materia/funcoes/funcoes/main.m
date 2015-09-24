//
//  main.m
//  funcoes
//
//  Created by Wallace Goncalves de Oliveira on 19/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>

double duplicarValor(double valor);
double IMC(double peso, double altura);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        double valor = 3.0;
        printf("Valor %.1f -> Dobro: %.1f", valor, duplicarValor(valor));
        
        double peso = 77.5;
        double altura = 1.79;
        double imc = IMC(peso, altura);
        printf("\nPeso %.2fkg e Altura %.2fm com IMC igual a %.2f", peso, altura, imc);
        
    }
    return 0;
}

double duplicarValor(double valor) {
    return valor * 2;
}

double IMC(double peso, double altura) {
    return peso / pow(altura, 2);
}