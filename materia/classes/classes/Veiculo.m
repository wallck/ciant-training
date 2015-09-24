//
//  Veiculo.m
//  classes
//
//  Created by Wallace Goncalves de Oliveira on 20/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Veiculo.h"

@implementation Veiculo

-(NSString *)descricao {
    return [[NSString alloc] initWithFormat:@"Viajando a %.1f km/h", [self velocidade]];
}

-(void)buzinar {
    printf(" Beep Beep!!");
}

@end
