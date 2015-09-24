//
//  Post.m
//  serializacao
//
//  Created by Wallace Goncalves de Oliveira on 04/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Post.h"

#define TITULO_KEY   @"Post_titulo"
#define CONTEUDO_KEY @"Post_conteudo"
#define DATA_KEY     @"Post_data"

@implementation Post

#pragma mark - Implementação do protocolo NSCoding

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (!self)
        return nil;
    
    _titulo     = [[aDecoder decodeObjectForKey:TITULO_KEY]   copy];
    _conteudo   = [[aDecoder decodeObjectForKey:CONTEUDO_KEY] copy];
    _data       = [[aDecoder decodeObjectForKey:DATA_KEY]     copy];
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_titulo    forKey:TITULO_KEY];
    [aCoder encodeObject:_conteudo  forKey:CONTEUDO_KEY];
    [aCoder encodeObject:_data      forKey:DATA_KEY];
}

@end
