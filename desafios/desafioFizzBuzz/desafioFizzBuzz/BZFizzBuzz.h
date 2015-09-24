//
//  FBFizzBuzz.h
//  desafioFizzBuzz
//
//  Created by Wallace Goncalves de Oliveira on 21/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BZFizzBuzz : NSObject

@property int total;

+(instancetype)newWithTotal:(int) total;
-(instancetype)initWithTotal:(int) total;
-(NSArray*)jogar;
-(void)print;

@end
