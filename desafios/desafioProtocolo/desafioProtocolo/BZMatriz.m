//
//  BZMatriz.m
//  desafioProtocolo
//
//  Created by Wallace Goncalves de Oliveira on 21/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "BZMatriz.h"


@class BZDataSource;
@implementation BZMatriz

+(instancetype)newWithRows:(int)rows andColumns:(int)columns {
    return [[BZMatriz alloc] initWithRows:rows andColumns:columns];
}
-(instancetype)init {
    return [self initWithRows:0 andColumns:0];
}
-(instancetype)initWithRows:(int)rows andColumns:(int)columns {
    self = [super init];
    
    if (self) {
        _source = [BZDataSource newWithRows:rows andColumns:columns];
        [self createWithRows:rows andColumns:columns];
    }
    
    return self;
}
-(void)createWithRows:(int)rows andColumns:(int)columns {
    _matriz = [NSMutableArray array];
    for (int i = 0; i < [_source quantidadeDeColunas]; i++) {
        NSMutableArray *columnArray = [NSMutableArray array];
        for (int j = 0; j < [_source quantidadeDeLinhas]; j++) {
            [columnArray addObject:@0];
        }
        [_matriz addObject:columnArray];
    }
}
-(void)setValue:(NSObject *)value forLine:(int)line Column:(int)column {
    [((NSMutableArray*)[_matriz objectAtIndex:column]) setObject:value atIndexedSubscript:line];
}
-(NSObject *)getValueForLine:(int)line Column:(int)column {
    return [((NSMutableArray*)[_matriz objectAtIndex:column]) objectAtIndex:line];
}

@end

@implementation BZDataSource {
    int _quantidadeDeLinhas;
    int _quantidadeDeColunas;
}

+(instancetype)newWithRows:(int)rows andColumns:(int)columns {
    return [[BZDataSource alloc] initWithRows:rows andColumns:columns];
}
-(instancetype)init {
    return [self initWithRows:0 andColumns:0];
}
-(instancetype)initWithRows:(int)rows andColumns:(int)columns {
    self = [super init];
    
    if (self) {
        _quantidadeDeLinhas = rows;
        _quantidadeDeColunas = columns;
    }
    
    return self;
}
-(int)quantidadeDeLinhas {
    return _quantidadeDeLinhas;
}
-(int)quantidadeDeColunas {
    return _quantidadeDeColunas;
}

@end