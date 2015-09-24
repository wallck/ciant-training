//
//  Temperatura.h
//  classes
//
//  Created by Wallace Goncalves de Oliveira on 20/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Temperatura : NSObject

@property double celcius;
@property double fahrenheit;
@property double kelvin;

-(instancetype)initWithCelcius:(double)temperature;
-(instancetype)initWithFahrenheit:(double)temperature;
-(instancetype)initWithKelvin:(double)temperature;

@end
