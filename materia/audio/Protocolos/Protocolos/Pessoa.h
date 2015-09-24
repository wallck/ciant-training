//
//  Pessoa.h
//  Protocolos
//
//  Created by Marcos Trovilho on 21/08/15.
//  Copyright (c) 2015 Marcos Trovilho. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Nadador <NSObject> // <Tipo>: "herança"
-(void)nadar;
@optional
-(void)nadarCrow;
-(void)nadarBorboleta;
@end

@protocol Tenista // sem <Tipo> não obriga a implementar outro protocolo
@required // por padrão todos são @required
-(void)jogarTenis;
@end



@interface Pessoa : NSObject <Nadador, Tenista>
@end
