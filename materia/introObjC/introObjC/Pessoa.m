//
//  Pessoa.m
//  introObjC
//
//  Created by Wallace Goncalves de Oliveira on 19/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Pessoa.h"

// Uma @interface dentro do Pessoa.m fica com seus Membros PRIVADOS
@interface Pessoa () {
    NSNumber *valor;
}

@property double salario;
@property (readwrite) int altura; // sobrecarga privada

// opcional declaração de métodos
// ...

@end

@implementation Pessoa {
    NSString *tipo;
}

-(void)andar {
    
}

-(void)setarAltura:(int)altura {
    _altura = altura;
}

-(void)andarPara:(int)direcao comPassos:(int)quantidade {
    
}

// Metodo Privado - Não está no Pessoa.h

-(void)setTipo:(NSString*)_tipo {
    tipo = _tipo;
}

@end
