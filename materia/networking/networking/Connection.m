//
//  Connection.m
//  networking
//
//  Created by Wallace Goncalves de Oliveira on 10/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Connection.h"

#define URL_BASE @"http://httpbin.org"

// NOTA:
// NSURLConnection DEPRECATED
// somente como referencia para codigo legado

@implementation Connection

#pragma mark - Networking

- (void)GET {
    NSString *URLString = [NSString stringWithFormat:@"%@/get", URL_BASE];
    NSURL *URL = [NSURL URLWithString:URLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLResponse *response = nil;
    NSError *error = nil;
    
    NSData *data = [NSURLConnection
                    sendSynchronousRequest:request
                    returningResponse:&response
                    error:&error];
    
    NSString *body = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@", body);
}

- (void)POST {
    NSString *URLString = [NSString stringWithFormat:@"%@/post", URL_BASE];
    NSURL *URL = [NSURL URLWithString:URLString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    request.HTTPMethod = @"POST";
    // post body
    request.HTTPBody = [@"{ \"chave\": \"valor\" }" dataUsingEncoding:NSUTF8StringEncoding];
    
    void(^handler)(NSURLResponse *response, NSData *data, NSError *error) =
    ^(NSURLResponse *response, NSData *data, NSError *error){
        NSString *body = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        NSLog(@"%@", body);
    };
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:handler];
}

@end