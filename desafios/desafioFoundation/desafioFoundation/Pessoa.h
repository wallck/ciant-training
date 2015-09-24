//
//  Pessoa.h
//  desafioFoundation
//
//  Created by Wallace Goncalves de Oliveira on 20/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pessoa : NSObject

@property NSString *nome;
@property NSNumber *anoDeNascimento;
@property (readonly) NSNumber *idade;
@property (readonly) NSNumber *totalDeLetrasDoNome;
@property (readonly) NSMutableString *letrasIniciaisDoNome;
@property (readonly) NSMutableString *vogais;
@property (readonly) NSMutableString *consoantes;

-(instancetype)initComNome:(NSString*)nome EAnoDeNascimento:(NSNumber*)ano;
-(NSString*)descricao;
-(NSMutableDictionary*)toDictionary;

@end
