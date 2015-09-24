//
//  Post.h
//  desafioBlog
//
//  Created by Wallace Goncalves de Oliveira on 04/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Comment.h"

@interface Post : NSObject <NSCoding>

@property (copy) NSNumber *userId;
@property (copy) NSNumber *ID;
@property (copy) NSString *title;
@property (copy) NSString *body;
@property NSMutableArray *comments;

+(instancetype)newWithJson:(NSDictionary*)json;
-(instancetype)initWithUserId:(NSNumber*)userId ID:(NSNumber*)ID title:(NSString*)title body:(NSString*)body;

-(Comment*)getComment:(NSNumber*)ID;
-(void)addComment:(Comment*)comment;
-(BOOL)loadComments;

@end
