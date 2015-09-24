//
//  main.m
//  desafioPratico01Comanda
//
//  Created by Wallace Goncalves de Oliveira on 19/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        double precoCoxinha = 3.5;
        double precoCerveja = 4.5;
        int quantidadeCoxinhas = 4;
        int quantidadeCervejas = 3;
        
        double totalCoxinha = quantidadeCoxinhas * precoCoxinha;
        double totalCerveja = quantidadeCervejas * precoCerveja;
        double total = totalCoxinha + totalCerveja;
        double dezPorcento = total * 0.1;
        double totalComDezPorcento = total + dezPorcento;
        
        printf("Desafio Comanda\n\n");
        printf("%d coxinhas = R$ %.2f\n", quantidadeCoxinhas, totalCoxinha);
        printf("%d cervejas = R$ %.2f\n", quantidadeCervejas, totalCerveja);
        printf("Valor sem serviço = R$ %.2f\n", total);
        printf("----------------------------\n");
        printf("Taxa 10%% = R$ %.2f\n", dezPorcento);
        printf("----------------------------\n");
        printf("Conta final = R$ %.2f", totalComDezPorcento);
        
    }
    return 0;
}
