//
//  Temperatura.m
//  classes
//
//  Created by Wallace Goncalves de Oliveira on 20/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Temperatura.h"

@implementation Temperatura

-(instancetype)init {
    return [self initTemperatures:6 withTemperature: 0];
}

-(instancetype)initTemperatures:(int)temperatureType withTemperature:(double)temperature {
    self = [super init];
    
    if (self) {
        switch (temperatureType) {
            case 1: //Celcius
                _celcius = temperature;
                _fahrenheit = (temperature * 1.8) + 32;
                _kelvin = temperature + 273;
                break;
            case 2: // Fahrenheit
                _celcius = (temperature - 32) / 1.8;
                _fahrenheit = temperature;
                _kelvin = ((temperature - 32) / 1.8) + 273;
                break;
            case 3: // Kelvin
                _celcius = temperature - 273;
                _fahrenheit = ((temperature - 273) * 1.8) + 32;
                _kelvin = temperature;
                break;
            case 6: // All
                _celcius = temperature;
                _fahrenheit = temperature;
                _kelvin = temperature;
                break;
            default:
                break;
        }
    }
    
    return self;
}

-(instancetype)initWithCelcius:(double)temperature {
    return [self initTemperatures:1 withTemperature:temperature];
}

-(instancetype)initWithFahrenheit:(double)temperature {
    return [self initTemperatures:2 withTemperature:temperature];
}

-(instancetype)initWithKelvin:(double)temperature {
    return [self initTemperatures:3 withTemperature:temperature];
}

@end
