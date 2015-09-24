//
//  Pessoa.h
//  Categorias
//
//  Created by Marcos Trovilho on 21/08/15.
//  Copyright (c) 2015 Marcos Trovilho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pessoa : NSObject {
    // para acessar ivars das extensoes devemos declara-las aqui
    // inclusive podem ser @private
    @private
    int _idade;
}

@property NSString *nome;

-(void)andar;

@end
