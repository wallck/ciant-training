//
//  Session.m
//  networking
//
//  Created by Wallace Goncalves de Oliveira on 10/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Session.h"

#define URL_BASE @"http://httpbin.org"

@interface Session () <NSURLSessionDataDelegate> {
    NSURLSession *_session;
}

@end

@implementation Session

-(instancetype)init {
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        _session = [NSURLSession
                    sessionWithConfiguration:config
                    delegate:self
                    delegateQueue:[NSOperationQueue mainQueue]];
    }
    return self;
}

#pragma mark - Networking

-(void)GET {
    NSString *URLString = [NSString stringWithFormat:@"%@/get", URL_BASE];
    NSURL *URL = [NSURL URLWithString:URLString];
    
    /*
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSURLSessionDataTask *task = [_session dataTaskWithRequest:request];
    [task resume];
    */
    // OU
    
    [[_session dataTaskWithURL:URL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSString *body = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", body);
    }] resume];
}

-(void)POST {
    NSString *URLString = [NSString stringWithFormat:@"%@/post", URL_BASE];
    NSURL *URL = [NSURL URLWithString:URLString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [@"{ \"chave\" : \"valor\" }" dataUsingEncoding:NSUTF8StringEncoding];
    
    [[_session dataTaskWithRequest:request] resume];
}

#pragma mark - NSURLSessionDataDelegate

-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    NSString *body = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@", body);
}

@end