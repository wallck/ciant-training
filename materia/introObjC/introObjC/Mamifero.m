//
//  Mamifero.m
//  introObjC
//
//  Created by Wallace Goncalves de Oliveira on 19/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Mamifero.h"

@implementation Mamifero

-(NSString *)fazerSom {
    return [[super fazerSom] stringByAppendingString: @" Mamífero"];
}

@end