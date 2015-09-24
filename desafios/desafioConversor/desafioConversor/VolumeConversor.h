//
//  VolumeConversor.h
//  desafioConversor
//
//  Created by Wallace Goncalves de Oliveira on 26/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Conversor.h"

@interface VolumeConversor : Conversor

+(instancetype)newComValorEmLitros:(NSNumber*)valor;

-(NSNumber*)paraGaloes;
-(NSNumber*)paraMetroCubico;
-(NSNumber*)paraCentimetroCubico;

@end
