//
//  Temperatura.h
//  desafioConversorTemperatura
//
//  Created by Wallace Goncalves de Oliveira on 24/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, TemperatureType) {
    TemperatureTypeCelcius = 0,
    TemperatureTypeFahrenheit = 1,
    TemperatureTypeKelvin = 2
};

// Converte automaticamente um NSUInteger em TemperaturaType
TemperatureType TemperatureTypeMake(NSUInteger value);

@interface Temperatura : NSObject

+(double)convert:(double)temperature from:(TemperatureType)input to:(TemperatureType)output;

@end
