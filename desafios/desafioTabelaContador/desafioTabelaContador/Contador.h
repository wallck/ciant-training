//
//  Contador.h
//  desafioTabelaContador
//
//  Created by Wallace Goncalves de Oliveira on 28/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contador : NSObject

@property NSNumber *valor;
@property (readonly) int intValue;
@property (readonly) NSMutableArray *numeros;

-(void)__maisUm;
-(void)__menosUm;
-(void)__zerar;

@end
