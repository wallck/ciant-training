//
//  MetricasConversor.h
//  desafioConversor
//
//  Created by Wallace Goncalves de Oliveira on 26/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Conversor.h"

@interface MetricasConversor : Conversor

+(instancetype)newComValorEmMetros:(NSNumber*)valor;

-(NSNumber*)paraKilometros;
-(NSNumber*)paraCentimetros;
-(NSNumber*)paraFeets;
-(NSNumber*)paraYards;

@end