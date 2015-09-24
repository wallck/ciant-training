//
//  Cuboide.h
//  classes
//
//  Created by Wallace Goncalves de Oliveira on 20/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cuboide : NSObject

@property double largura;
@property double altura;
@property double profundidade;
@property (readonly) double volume;

-(instancetype)initComLargura:(double)largura eAltura:(double)altura eProfundidade:(double)profundidade;
-(double)calcularVolume;

@end
