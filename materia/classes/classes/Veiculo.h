//
//  Veiculo.h
//  classes
//
//  Created by Wallace Goncalves de Oliveira on 20/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Veiculo : NSObject

@property double velocidade;
@property NSString *descricao;

-(void)buzinar;

@end
