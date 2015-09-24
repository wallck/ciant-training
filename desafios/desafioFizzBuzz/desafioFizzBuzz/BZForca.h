//
//  Foca.h
//  desafioFizzBuzz
//
//  Created by Wallace Goncalves de Oliveira on 21/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BZForca : NSObject

@property (readonly) int quantidadeDeVidas;
@property NSString *palavra;
@property NSMutableString *palavraMascarada;

+(instancetype)newComPalavra:(NSString*)palavra;

-(BOOL)chute:(NSString*)letra;
-(BOOL)ganhou;
-(void)printPalavraMascarada;

@end
