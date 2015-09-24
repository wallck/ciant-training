//
//  Blog.m
//  desafioBlog
//
//  Created by Wallace Goncalves de Oliveira on 04/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Blog.h"
#import "JsonHelper.h"

#define URL_POSTS       @"http://jsonplaceholder.typicode.com/posts"
#define STORE_FILE_NAME @"blog.data"
#define POSTS_KEY       @"Blog_posts"

@implementation Blog

+(instancetype)new {
    return [[Blog alloc] init];
}
-(instancetype)init {
    self = [super init];
    
    if (!self)
        return nil;
    
    _posts = [NSMutableArray array];
    
    return self;
}

+(instancetype)loadCache {
    return [Blog loadCache:STORE_FILE_NAME];
}
+(instancetype)loadCache:(NSString *)fileName {
    return [Blog loadCache:fileName origin:NSCachesDirectory];
}
+(instancetype)loadCache:(NSString *)fileName origin:(NSSearchPathDirectory)origin {
    NSString *path = NSSearchPathForDirectoriesInDomains(origin, NSUserDomainMask, YES)[0];
    Blog *blog = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    if (!blog) {
        blog = [Blog new];
        
        NSArray *posts = [JsonHelper getArrayOfJson:URL_POSTS];
        
        for (NSDictionary *jsonPost in posts) {
            Post *post = [Post newWithJson:jsonPost];
            [blog addPost:post];
        }
        
        [blog serialize];
    }
    
    return blog;
}

-(BOOL)serialize {
    return [self serialize:STORE_FILE_NAME];
}
-(BOOL)serialize:(NSString *)fileName {
    return [self serialize:fileName destiny:NSCachesDirectory];
}
-(BOOL)serialize:(NSString *)fileName destiny:(NSSearchPathDirectory)destiny {
    NSString *path = NSSearchPathForDirectoriesInDomains(destiny, NSUserDomainMask, YES)[0];
    path = [path stringByAppendingPathComponent:fileName];
    
    NSError *error = nil;
    [NSFileManager.defaultManager
     removeItemAtPath:path
     error:&error];
    
    if (error)
        NSLog(@"Error on remove Cache: %@", error);
    
    // serializando o objeto e escrevendo no arquivo
    BOOL status = [NSKeyedArchiver archiveRootObject:self toFile:path];
    
    return status;
}
-(void)clearCache {
    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    path = [path stringByAppendingPathComponent:STORE_FILE_NAME];
    
    NSError *error = nil;
    [NSFileManager.defaultManager
     removeItemAtPath:path
     error:&error];
    
    if (error)
        NSLog(@"Error on remove Cache: %@", error);
}

-(BOOL)hasPost:(Post *)post {
    Post *p = [self getPost:post.ID];
    
    if (p) {
        return YES;
    }
    
    return NO;
}
-(Post *)getPost:(NSNumber*)ID {
    for (Post *p in _posts) {
        if ([p.ID isEqual: ID]) {
            return p;
        }
    }
    
    return nil;
}
-(void)addPost:(Post *)post {
    if (![self hasPost:post]) {
        [_posts addObject:post];
    }
}

#pragma mark - Implementação do protocolo NSCoding

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (!self)
        return nil;
    
    _posts = [[aDecoder decodeObjectForKey:POSTS_KEY] copy];
    
    return self;
}
-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_posts forKey:POSTS_KEY];
}

@end
