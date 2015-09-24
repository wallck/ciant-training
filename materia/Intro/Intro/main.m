//
//  main.m
//  Intro
//
//  Created by Wallace Goncalves de Oliveira on 18/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSLog(@"Hello, CI&T!");
        NSLog(@"Teste: %@", @28);
        
        // formatando string para serem exibidas
        // apostila pag 28
        
        NSLog(@"%d - %i, %.2f - %% %@", 3, 7, 0.4562, @"Teste");
        
        // notas do %f
        // %XY.Zf
        //  X -> numero para padding
        //  Y -> padding esquerdo
        //  Z -> casas decimais
        // ex: relogio 24hrs
        // %02.1f -> 01, 02, ... 10
        
        // caracteres de escape
        // \n - quebra de linha
        // \t - tabulação
        // \" - aspas duplas
        // \' - aspas simples
        
        printf("teste\nquebra\nde linha\n");
        printf("chave:\tvalor\n");
        NSLog(@"\"entre \'aspas\'\"");
        
#pragma mark - Variáveis
        
        int valor;
        valor = 5;
        // ou
        int outroValor = 6;
        
        // tipos simples equivalente C
        // int, double, float, char, BOOL
        
        // tipos simples Obj-C
        // NSInteger, NSUInteger

#pragma mark - Constantes
        
#define NOME_DA_CONSTANTE @"Constante"
        int const constante = 5;
        NSString *const outraConstante = NOME_DA_CONSTANTE;
        
#pragma mark - Escopos
        
        // a variavel temperatura só existe aqui dentro
        {
            double temperatura = 28.4;
            NSLog(@"T: %fC", temperatura);
        }
    
#pragma mark - Operadores
        
        int atribuicao = 0;
        
        double soma = 4 + 3.7;
        soma += 5.3;
        
        float subtracao = 9 - 3;
        subtracao -= 1.7;
        
        // mesma coisa para multiplicação, divisão *,/
        
        int incremento = 0;
        incremento++;
        ++incremento;
        
        int decremento = 10;
        decremento--;
        --decremento;
        
        // modulo
        int resto = 10 % 3;
        resto %= 2;
        
#pragma mark - Comparacao
        
        // BOOL tem valores YES e NO
        BOOL resultado;
        resultado = 2 == 5;
        resultado = 2 != 5;
        
        resultado = !resultado;
        
        resultado = 5 > 7;
        resultado = 5 >= 7;
        
        resultado = 5 < 7;
        resultado = 5 <= 7;
        
        // bitshift
        int numero = 5 << 1;  // 0101 -> 1010
        numero = numero >> 1; // 1010 -> 0101
        
#pragma mark - Controle de Fluxo
        
        if (YES)
            printf("YES");
        else if (NO)
            printf("NO");
        else if (YES && resultado)
            printf("YES YES");
        else if (YES && !resultado)
            printf("YES NO");
        else
            printf("EXCEPTION");
        
        switch (numero) {
            case 1:
                printf("1");
                break;
                
            default:
                printf("default");
                break;
        }
        
        
        
    }
    return 0;
}