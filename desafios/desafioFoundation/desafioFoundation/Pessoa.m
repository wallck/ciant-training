//
//  Pessoa.m
//  desafioFoundation
//
//  Created by Wallace Goncalves de Oliveira on 20/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Pessoa.h"

#define ANO_ATUAL 2015

@implementation Pessoa

-(instancetype)init {
    return [self initComNome:@"" EAnoDeNascimento:@2015];
}

-(instancetype)initComNome:(NSString*)nome EAnoDeNascimento:(NSNumber*)ano {
    self = [super init];
    
    if (self) {
        self.nome = nome;
        self.anoDeNascimento = ano;
    }
    
    return self;
}

-(void)setNome:(NSString *)nome {
    
    _nome = nome;
    
    _letrasIniciaisDoNome = [NSMutableString string];
    NSArray *palavrasDoNome = [[_nome uppercaseString] componentsSeparatedByString:@" "];
    for (NSString *palavra in palavrasDoNome) {
        [_letrasIniciaisDoNome appendString:[palavra substringWithRange:NSMakeRange(0, 1)]];
    }
    
    _totalDeLetrasDoNome = [NSNumber numberWithInteger: [_nome length] - [palavrasDoNome count] - 1];
    
    _vogais = [NSMutableString string];
    _consoantes = [NSMutableString string];
    NSArray *vogais = @[ @"a", @"e", @"i", @"o", @"u" ];
    for (int i = 0; i < [_nome length]; i++) {
        NSString *letra = [_nome substringWithRange:NSMakeRange(i, 1)];
        if ([vogais containsObject:letra])
            [_vogais appendString: letra];
        else
            [_consoantes appendString: letra];
    }
}

-(void)setAnoDeNascimento:(NSNumber *)anoDeNascimento {
    _anoDeNascimento = anoDeNascimento;
    
    if ([_anoDeNascimento isGreaterThan: @2015])
        _idade = @0;
    
    _idade = @(ANO_ATUAL - _anoDeNascimento.intValue);
}

-(NSString *)descricao {
    return [[NSString alloc] initWithFormat:@"%@, %@ anos", _nome, _idade];
}

-(NSMutableDictionary *)toDictionary {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    dic[@"nome"] = _nome;
    dic[@"idade"] = _idade;
    dic[@"anoDeNascimento"] = _anoDeNascimento;
    dic[@"totalDeLetrasDoNome"] = _totalDeLetrasDoNome;
    dic[@"letrasIniciaisDoNome"] = _letrasIniciaisDoNome;
    dic[@"vogais"] = _vogais;
    dic[@"consoantes"] = _consoantes;
    
    return dic;
}

@end
