//
//  Operacao.h
//  operation
//
//  Created by Wallace Goncalves de Oliveira on 15/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@class Operacao;
@protocol OperacaoDelegate <NSObject>

-(void)operacaoTerminouDeBaixarImagem:(UIImage *)imagem;

@end

typedef void (^OperacaoTerminouHandler)(UIImage *imagem);

@interface Operacao : NSOperation

@property (nonatomic) NSURL *URL;
@property (nonatomic, weak) id<OperacaoDelegate> delegate;
@property (nonatomic, copy) OperacaoTerminouHandler handler;

-(instancetype)initWithURL:(NSURL*)URL delegate:(id<OperacaoDelegate>) delegate;
-(instancetype)initWithURL:(NSURL*)URL;

@end
