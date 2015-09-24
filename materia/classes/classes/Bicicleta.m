//
//  Bicicleta.m
//  classes
//
//  Created by Wallace Goncalves de Oliveira on 20/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Bicicleta.h"

@implementation Bicicleta

-(NSString *)descricao {
    return [@"Bicicleta " stringByAppendingString: [super descricao]];
}

-(void)buzinar {
    printf(" Fon Fon!");
}

@end
