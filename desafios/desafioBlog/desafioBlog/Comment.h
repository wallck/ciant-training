//
//  Comment.h
//  desafioBlog
//
//  Created by Wallace Goncalves de Oliveira on 04/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Comment : NSObject <NSCoding>

@property NSNumber *postId;
@property NSNumber *ID;
@property (copy) NSString *name;
@property (copy) NSString *email;
@property (copy) NSString *body;

+(instancetype)newWithJson:(NSDictionary*)json;
-(instancetype)initWithPostId:(NSNumber*)postId ID:(NSNumber*)ID name:(NSString*)name email:(NSString*)email body:(NSString*)body;

@end
