//
//  BZMatriz.h
//  desafioProtocolo
//
//  Created by Wallace Goncalves de Oliveira on 21/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MatrizDataSource <NSObject>

-(int)quantidadeDeLinhas;
-(int)quantidadeDeColunas;

@end

@interface BZMatriz : NSObject

@property (readonly) id<MatrizDataSource> source;
@property (readonly) NSMutableArray *matriz;
+(instancetype)newWithRows:(int)rows andColumns:(int)columns;
-(void)setValue:(NSObject*)value forLine:(int)line Column:(int)column;
-(NSObject*)getValueForLine:(int)line Column:(int)column;

@end

@interface BZDataSource : NSObject<MatrizDataSource>

+(instancetype)newWithRows:(int)rows andColumns:(int)columns;
-(int)quantidadeDeLinhas;
-(int)quantidadeDeColunas;

@end