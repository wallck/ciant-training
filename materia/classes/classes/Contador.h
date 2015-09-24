//
//  Contator.h
//  classes
//
//  Created by Wallace Goncalves de Oliveira on 20/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contador : NSObject

#pragma mark - Propriedades

/// valor atual do contador
@property (readonly) int valor;

#pragma mark - Métodos de Classe

+(NSString*)descricao;
+(instancetype)newComInicio:(int)valorInicial;

#pragma mark - Métodos de Instância

/**
 Incrementar
 
 Incrementa em 1
 @see - incrementarEm:
 */
-(void)incrementar;

/**
 IncrementarEm
 
 @param incrementa em uma quantidade específica
 */
-(void)incrementarEm:(int)incremento;

/**
 Reset
 
 Zera o contador
 */
-(void)reset;

@end
