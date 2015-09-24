//
//  IdadeCaninaConversor.h
//  desafioConversor
//
//  Created by Wallace Goncalves de Oliveira on 26/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Conversor.h"

@interface IdadeCaninaConversor : Conversor

+(instancetype)newComIdadeCanina:(NSNumber*)idade;

-(NSNumber*)paraIdadeHumana;

@end
