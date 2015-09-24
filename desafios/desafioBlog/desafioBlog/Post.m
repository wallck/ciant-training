//
//  Post.m
//  desafioBlog
//
//  Created by Wallace Goncalves de Oliveira on 04/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Post.h"
#import "JsonHelper.h"

#define URL_COMMENTS    @"http://jsonplaceholder.typicode.com/comments?postId=%@"
#define STORE_FILE_NAME @"post.data"

#define USER_ID_KEY     @"Post_userId"
#define ID_KEY          @"Post_ID"
#define TITLE_KEY       @"Post_title"
#define BODY_KEY        @"Post_body"
#define COMMENTS_KEY    @"Post_comments"

#define JSON_USER_ID    @"userId"
#define JSON_ID         @"id"
#define JSON_TITLE      @"title"
#define JSON_BODY       @"body"

@implementation Post

+(instancetype)newWithJson:(NSDictionary *)json {
    NSNumber *userId = [json objectForKey:JSON_USER_ID];
    NSNumber *ID = [json objectForKey:JSON_ID];
    NSString *title = [json objectForKey:JSON_TITLE];
    NSString *body = [json objectForKey:JSON_BODY];
    
    Post *p = [[Post alloc] initWithUserId:userId ID:ID title:title body:body];
    
    return p;
}
-(instancetype)init {
    return [self initWithUserId:0 ID:0 title:@"" body:@""];
}
-(instancetype)initWithUserId:(NSNumber*)userId ID:(NSNumber*)ID title:(NSString*)title body:(NSString*)body {
    self = [super init];
    
    if (!self) {
        return nil;
    }
    
    _userId     = userId;
    _ID         = ID;
    _title      = title;
    _body       = body;
    _comments   = [NSMutableArray array];
    
    return self;
}

-(BOOL)hasComment:(Comment *)comment {
    Comment *c = [self getComment:comment.ID];
    
    if (c) {
        return YES;
    }
    
    return NO;
}
-(Comment *)getComment:(NSNumber*)ID {
    for (Comment *c in _comments) {
        if ([c.ID isEqual: ID]) {
            return c;
        }
    }
    return nil;
}
-(void)addComment:(Comment *)comment {
    if (![self hasComment:comment]) {
        [_comments addObject:comment];
    }
}
-(BOOL)loadComments {
    if (_comments.count > 0)
        return NO;
    
    NSString *url = [NSString stringWithFormat:URL_COMMENTS, _ID];
    NSArray *comments = [JsonHelper getArrayOfJson:url];
    
    for (NSDictionary *json in comments) {
        Comment *c = [Comment newWithJson:json];
        [_comments addObject:c];
    }
    
    return YES;
}

#pragma mark - Implementação do protocolo NSCoding (Para Serializar)

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (!self)
        return nil;
    
    _userId     = [[aDecoder decodeObjectForKey:USER_ID_KEY]    copy];
    _ID         = [[aDecoder decodeObjectForKey:ID_KEY]         copy];
    _title      = [[aDecoder decodeObjectForKey:TITLE_KEY]      copy];
    _body       = [[aDecoder decodeObjectForKey:BODY_KEY]       copy];
    _comments   = [[aDecoder decodeObjectForKey:COMMENTS_KEY]   copy];
    
    return self;
}
-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_userId    forKey:USER_ID_KEY];
    [aCoder encodeObject:_ID        forKey:ID_KEY];
    [aCoder encodeObject:_title     forKey:TITLE_KEY];
    [aCoder encodeObject:_body      forKey:BODY_KEY];
    [aCoder encodeObject:_comments  forKey:COMMENTS_KEY];
}

@end
