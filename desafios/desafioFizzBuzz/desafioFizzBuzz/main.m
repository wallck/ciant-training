//
//  main.m
//  desafioFizzBuzz
//
//  Created by Wallace Goncalves de Oliveira on 21/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BZFizzBuzz.h"
#import "BZForca.h"

void fizzBuzz() {
    BZFizzBuzz *fb = [BZFizzBuzz newWithTotal:20];
    [fb print];
}

BOOL chuteForca(BZForca *f, NSString *letra) {
    [f chute:letra];
    if (f.quantidadeDeVidas > 0) {
        [f printPalavraMascarada];
        if ([f ganhou])
            return YES;
    }
    return NO;
}

void forca() {
    BZForca *f = [BZForca newComPalavra:@"WILLIAM"];

    printf("JOGO DA FORCA\n-------------\n\n%s (%d LETRAS)\n\n",
           [[f palavraMascarada] cStringUsingEncoding:NSUTF8StringEncoding],
           (int)[f palavraMascarada].length);
    
    NSArray *chutes = @[ @"A", @"E", @"I", @"O", @"U", @"C", @"W", @"L", @"M", @"K", @"V" ];
    
    for (NSString *letra in chutes) {
        if (chuteForca(f, letra)) {
            printf("\n\nPARABÉNS VOCÊ GANHOU :) !!!");
            break;
        } else if ([f quantidadeDeVidas] < 1) {
            printf("\n\nVOCÊ PERDEU :( !!!");
            break;
        }
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //fizzBuzz();
        forca();
        
    }
    return 0;
}