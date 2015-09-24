//
//  main.m
//  desafio01
//
//  Created by Wallace Goncalves de Oliveira on 19/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *nome = @"Wallace Oliveira";
        NSString *localNascimento = @"Belo Horizonte";
        int idade = 28;
        double altura = 1.79;
        double temperaturaHoje = 21;
        
        double temperaturaHojeF = (temperaturaHoje) * 1.8 + 32;
        double temperaturaHojeK =  temperaturaHoje + 273;
        double alturaPes = altura / 100 * 32.8;
        
        printf("Dados Pessoais:\n");
        printf("%s\n", [nome cStringUsingEncoding:NSUTF8StringEncoding]);
        printf("%d anos e %.2f de altura (%.2f pés)\n", idade, altura, alturaPes);
        printf("natural de %s\n", [localNascimento cStringUsingEncoding:NSUTF8StringEncoding]);
        
        printf("\nDados da Cidade:\n");
        printf("%.1f C\n", temperaturaHoje);
        printf("%.1f F\n", temperaturaHojeF);
        printf("%.1f K\n", temperaturaHojeK);
        
        printf("Está quente hoje? %s", temperaturaHoje > 27 ? "Sim" : "Não");
    }
    return 0;
}
