//
//  Notificador.m
//  notificationCenter
//
//  Created by Wallace Goncalves de Oliveira on 08/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Notificador.h"

#define NOTIFICACAO_INTERNA @"NotificacaoInterna"
NSString *const NotificadorNome = @"NotificacaoExterna";

@implementation Notificador

-(instancetype)init {
    self = [super init];
    if (self) {
        [self ligarNotificacao];
    }
    return self;
}

-(void)dealloc {
    [self desligarNotificacao];
}

-(void)ligarNotificacao {
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(recebiNotificacao)
                                               name:NOTIFICACAO_INTERNA
                                             object:nil];
}

-(void)desligarNotificacao {
    [NSNotificationCenter.defaultCenter removeObserver:self
                                                  name:NOTIFICACAO_INTERNA
                                                object:nil];
}

-(void)recebiNotificacao {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

-(void)notificar {
    // aviso interno (com DEFINE)
    [NSNotificationCenter.defaultCenter postNotificationName:NOTIFICACAO_INTERNA object:nil];
    
    // aviso externo (com CONSTANTE - Recomendado)
    [NSNotificationCenter.defaultCenter postNotificationName:NotificadorNome object:self];
}

@end
