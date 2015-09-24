//
//  Pessoa.h
//  introObjC
//
//  Created by Wallace Goncalves de Oliveira on 19/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pessoa : NSObject

#pragma mark - Propriedades

// padrão de "qualificadores":
// @property (atomic, strong) tipo nomeDaPropriedade;
// (strong) retém a propriedade na memória (até a instância da classe morrer)

@property NSString *nome;
@property int idade;

// (nonatomic) deixa o acesso não atomico, cuidado com multithreads!
// (copy) vai fazer uma copia do objeto "privada" para a instancia
@property (nonatomic, copy) NSString *cpf;

// (weak) não segura o objeto na memória (quando para de ser referenciado, morre)
// id simboliza qualquer objeto
@property (weak) id delegate;

// strong, copy e weak são irmãos
// nonatomic, atomic são irmãos

// cria apenas o acessador Getter
@property (readonly) int altura;

#pragma mark - Funções

-(void)andar;
-(void)setarAltura:(int)altura;
-(void)andarPara:(int)direcao comPassos:(int)quantidade;

@end
