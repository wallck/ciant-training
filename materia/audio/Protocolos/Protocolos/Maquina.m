//
//  Maquina.m
//  Protocolos
//
//  Created by Marcos Trovilho on 21/08/15.
//  Copyright (c) 2015 Marcos Trovilho. All rights reserved.
//

#import "Maquina.h"

@implementation Maquina

-(instancetype)initWithDelegate: (id<MaquinaDelegate>)delegate {
    if ((self = [super init])) {
        _delegate = delegate;
    }
    
    return self;
}

-(void)comecar {
    printf("[Maquina] comecei peça\n");
    // self.delegate equivalente a _delegate
    if (self.delegate)
        [self.delegate maquinaComecou:self];
}

-(void)terminar {
    if (_delegate) {
        [_delegate maquinaTerminou:self];
        
        if ([_delegate respondsToSelector:@selector(maquina:realizouTarefa:)]) {
            if ([_delegate maquina:self realizouTarefa:@"Peça"])
                printf("Peça deu certo!\n");
        }
    }
}

@end