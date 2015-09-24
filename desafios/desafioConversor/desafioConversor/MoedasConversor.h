//
//  MoedasConversor.h
//  desafioConversor
//
//  Created by Wallace Goncalves de Oliveira on 26/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Conversor.h"

@interface MoedasConversor : Conversor

+(instancetype)newComValorEmReais:(NSNumber*)valor;

-(NSNumber*)paraDollar;
-(NSNumber*)paraEuro;
-(NSNumber*)paraLibra;

@end
