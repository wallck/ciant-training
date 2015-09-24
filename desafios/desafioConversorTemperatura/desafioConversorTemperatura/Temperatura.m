//
//  Temperatura.m
//  desafioConversorTemperatura
//
//  Created by Wallace Goncalves de Oliveira on 24/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Temperatura.h"

TemperatureType TemperatureTypeMake(NSUInteger value) {
    switch (value) {
        case 1: return TemperatureTypeFahrenheit;
        case 2: return TemperatureTypeKelvin;
        default: return TemperatureTypeCelcius;
    }
}

@implementation Temperatura

+(double)convert:(double)temperature from:(TemperatureType)input to:(TemperatureType)output {
    
    switch (input) {
        case TemperatureTypeCelcius:
            switch (output) {
                case TemperatureTypeCelcius: return temperature;
                case TemperatureTypeFahrenheit: return (temperature * 1.8) + 32;
                case TemperatureTypeKelvin: return temperature + 273;
            }
            break;
        case TemperatureTypeFahrenheit:
            switch (output) {
                case TemperatureTypeCelcius: return (temperature - 32) / 1.8;
                case TemperatureTypeFahrenheit: return temperature;
                case TemperatureTypeKelvin: return ((temperature - 32) / 1.8) + 273;
            }
            break;
        case TemperatureTypeKelvin:
            switch (output) {
                case TemperatureTypeCelcius: return temperature - 273;
                case TemperatureTypeFahrenheit: return ((temperature - 273) * 1.8) + 32;
                case TemperatureTypeKelvin: return temperature;
            }
            break;
    }
}

@end
