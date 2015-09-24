//
//  Operacao.m
//  operation
//
//  Created by Wallace Goncalves de Oliveira on 15/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Operacao.h"

@implementation Operacao

-(instancetype)initWithURL:(NSURL *)URL {
    return [self initWithURL:URL delegate:nil];
}
-(instancetype)initWithURL:(NSURL *)URL delegate:(id<OperacaoDelegate>)delegate {
    self = [super init];
    if (self) {
        _URL = URL;
        _delegate = delegate;
    }
    return self;
}

#pragma mark -

-(void)main {
    NSLog(@"Operacao rodando");
    
    NSData *imageData = [NSData dataWithContentsOfURL:_URL];
    UIImage *image = [UIImage imageWithData:imageData];
    
    if (_delegate) {
        SEL selector = @selector(operacaoTerminouDeBaixarImagem:);

        [(NSObject *)_delegate
         performSelectorOnMainThread:selector
         withObject:image
         waitUntilDone:NO];
    }
    
    if (_handler) {
        dispatch_async(dispatch_get_main_queue(), ^{
            _handler(image);
        });
    }
}

@end
