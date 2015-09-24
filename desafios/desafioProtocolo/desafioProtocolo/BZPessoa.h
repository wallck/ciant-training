//
//  BZPessoa.h
//  desafioProtocolo
//
//  Created by Wallace Goncalves de Oliveira on 21/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Nomeavel <NSObject>

-(NSString*) nome;

@end

@protocol Envelhecivel <NSObject>

-(int) idade;

@end

@interface BZPessoa : NSObject <Nomeavel, Envelhecivel>

+(instancetype)newWithNome:(NSString*)nome andIdade:(int)idade;

@property (readonly) NSString *nome;
@property (readonly) int idade;

@end