//
//  Comment.m
//  desafioBlog
//
//  Created by Wallace Goncalves de Oliveira on 04/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Comment.h"

#define POST_ID_KEY     @"Comment_postId"
#define ID_KEY          @"Comment_ID"
#define NAME_KEY        @"Comment_name"
#define EMAIL_KEY       @"Comment_email"
#define BODY_KEY        @"Comment_body"

#define JSON_POST_ID    @"postId"
#define JSON_ID         @"id"
#define JSON_NAME       @"name"
#define JSON_EMAIL      @"email"
#define JSON_BODY       @"body"

@implementation Comment

+(instancetype)newWithJson:(NSDictionary *)json {

    NSNumber *postId = [json objectForKey:JSON_POST_ID];
    NSNumber *ID = [json objectForKey:JSON_ID];
    NSString *name = [json objectForKey:JSON_NAME];
    NSString *email = [json objectForKey:JSON_EMAIL];
    NSString *body = [json objectForKey:JSON_BODY];
    
    Comment *c = [[Comment alloc] initWithPostId:postId ID:ID name:name email:email body:body];
    
    return c;
}
-(instancetype) init{
    return [self initWithPostId:0 ID:0 name:@"" email:@"" body:@""];
}
-(instancetype)initWithPostId:(NSNumber*)postId ID:(NSNumber*)ID name:(NSString *)name email:(NSString *)email body:(NSString *)body {
    self = [super init];
    
    if (!self)
        return nil;
    
    _postId = postId;
    _ID = ID;
    _name = name;
    _email = email;
    _body = body;
    
    return self;
}

#pragma mark - Implementação do protocolo NSCoding

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (!self)
        return nil;
    
    _postId     = [[aDecoder decodeObjectForKey:POST_ID_KEY]    copy];
    _ID         = [[aDecoder decodeObjectForKey:ID_KEY]         copy];
    _name       = [[aDecoder decodeObjectForKey:NAME_KEY]       copy];
    _email      = [[aDecoder decodeObjectForKey:EMAIL_KEY]      copy];
    _body       = [[aDecoder decodeObjectForKey:BODY_KEY]       copy];
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_postId    forKey:POST_ID_KEY];
    [aCoder encodeObject:_ID        forKey:ID_KEY];
    [aCoder encodeObject:_name      forKey:NAME_KEY];
    [aCoder encodeObject:_email     forKey:EMAIL_KEY];
    [aCoder encodeObject:_body      forKey:BODY_KEY];
}

@end