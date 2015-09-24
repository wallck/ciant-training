//
//  Blog.h
//  desafioBlog
//
//  Created by Wallace Goncalves de Oliveira on 04/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Post.h"

@interface Blog : NSObject <NSCoding>

@property (readonly) NSMutableArray *posts;

+(instancetype)loadCache;
+(instancetype)loadCache:(NSString*)fileName;
+(instancetype)loadCache:(NSString*)fileName origin:(NSSearchPathDirectory)origin;

-(BOOL)serialize;
-(BOOL)serialize:(NSString*)fileName;
-(BOOL)serialize:(NSString*)fileName destiny:(NSSearchPathDirectory)destiny;
-(void)clearCache;

-(Post*)getPost:(NSNumber*)ID;
-(void)addPost:(Post*)post;

@end
