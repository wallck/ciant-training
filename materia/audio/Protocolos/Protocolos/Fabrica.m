//
//  Fabrica.m
//  Protocolos
//
//  Created by Marcos Trovilho on 21/08/15.
//  Copyright (c) 2015 Marcos Trovilho. All rights reserved.
//

#import "Fabrica.h"

@implementation Fabrica

-(void)maquinaComecou:(Maquina *)maquina {
    printf("[Fábrica] máquina começou\n");
}

-(void)maquinaTerminou:(Maquina *)maquina {
    printf("[Fábrica] máquina terminou\n");
}

// Comunicação entre a fábrica e a máquina
// ex: checagem de peça com defeito
-(BOOL)maquina:(Maquina *)maquina realizouTarefa:(NSString *)tarefa {
    return [tarefa isEqualToString:@"Peça"];
}

@end
