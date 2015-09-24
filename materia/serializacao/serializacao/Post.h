//
//  Post.h
//  serializacao
//
//  Created by Wallace Goncalves de Oliveira on 04/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>

// NSCoding deixa a classe serializável
@interface Post : NSObject <NSCoding>

@property (copy) NSString *titulo;
@property (copy) NSString *conteudo;
@property (copy) NSDate *data;

@end
