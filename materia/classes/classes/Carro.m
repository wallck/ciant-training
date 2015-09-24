//
//  Carro.m
//  classes
//
//  Created by Wallace Goncalves de Oliveira on 20/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Carro.h"

@implementation Carro

-(NSString *)descricao {
    NSString *novaDescricaoComFormat = [@"Carro " stringByAppendingString: [super descricao]];
    novaDescricaoComFormat = [novaDescricaoComFormat stringByAppendingString: @" na marcha %d"];
    return [[NSString alloc] initWithFormat:novaDescricaoComFormat, [self marcha]];
}

@end
