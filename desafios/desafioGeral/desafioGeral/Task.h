//
//  Task.h
//  desafioGeral
//
//  Created by Wallace Goncalves de Oliveira on 02/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

@property NSString *name;
@property BOOL status;

+(instancetype)newWithName:(NSString*)name;

@end
