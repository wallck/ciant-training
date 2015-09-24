//
//  Mamifero.h
//  introObjC
//
//  Created by Wallace Goncalves de Oliveira on 19/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Animal.h"

@interface Mamifero : Animal {
    // padrão: @protected
    
    @public
    NSString *nome;
    
    @private
    NSString *apelido;
    int idade;
}

@end
