//
//  NSString+Extensao.m
//  Categorias
//
//  Created by Marcos Trovilho on 21/08/15.
//  Copyright (c) 2015 Marcos Trovilho. All rights reserved.
//

#import "NSString+Extensao.h"

@implementation NSString (Extensao)

-(NSArray *)split:(NSString *)token {
    return [self componentsSeparatedByString:token];
}

-(BOOL)isEmpty {
    return !self || self.length == 0;
}

@end
