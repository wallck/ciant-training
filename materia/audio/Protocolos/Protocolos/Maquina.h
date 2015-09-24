//
//  Maquina.h
//  Protocolos
//
//  Created by Marcos Trovilho on 21/08/15.
//  Copyright (c) 2015 Marcos Trovilho. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Maquina; // Trust me i'm engineer
@protocol MaquinaDelegate <NSObject>

-(void)maquinaComecou:(Maquina*)maquina;
-(void)maquinaTerminou:(Maquina*)maquina;

@optional

-(BOOL)maquina:(Maquina*)maquina realizouTarefa:(NSString*)tarefa;

@end

@interface Maquina : NSObject

@property id<MaquinaDelegate> delegate;

-(instancetype)initWithDelegate: (id<MaquinaDelegate>)delegate;
-(void)comecar;
-(void)terminar;

@end
