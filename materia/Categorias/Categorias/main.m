//
//  main.m
//  Categorias
//
//  Created by Marcos Trovilho on 21/08/15.
//  Copyright (c) 2015 Marcos Trovilho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pessoa.h"
#import "Pessoa+Extensao.h"
#import "NSString+Extensao.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Pessoa *p = [Pessoa new];
        
        // precisamos importar o "Pessoa+Extensao.h"
        [p calcular];
        
        NSArray *split = [@"asd asd asd" split:@" "];
    }
    return 0;
}
