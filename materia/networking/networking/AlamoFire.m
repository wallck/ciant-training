//
//  AlamoFire.m
//  networking
//
//  Created by Wallace Goncalves de Oliveira on 10/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "AlamoFire.h"
#import <AFNetworking/AFNetworking.h>

#define URL_BASE @"http://httpbin.org"

@implementation AlamoFire

- (void)GET {
    NSString *url = [NSString stringWithFormat:@"%@/get", URL_BASE];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url
      parameters:nil
         success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
            NSLog(@"%@", responseObject);
         }
         failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
            NSLog(@"%@", error);
         }];
}

- (void)POST {
    NSString *url = [NSString stringWithFormat:@"%@/post", URL_BASE];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:url
       parameters:@{ @"chave": @"valor" }
          success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
              NSLog(@"%@", responseObject);
          }
          failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
              NSLog(@"%@", error);
          }];
}

@end
