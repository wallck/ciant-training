//
//  ViewController.m
//  JSON
//
//  Created by Wallace Goncalves de Oliveira on 08/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    
}

@end

@implementation ViewController

-(void)lerJSON {
    NSString *JSONString = @"{\"chave\":\"valor\"}";
    
    NSData *JSONData = [JSONString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error = nil;
    NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData:JSONData
                                                         options:0
                                                           error:&error];
    
    NSLog(@"%@", JSON);
}

-(void)escreverJSON {
    
    NSDictionary *JSONDict = @{ @"chave": @"valor" };
    
    NSError *error = nil;
    NSData *JSONData = [NSJSONSerialization dataWithJSONObject:JSONDict
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    
    NSString *JSONString = [[NSString alloc] initWithData:JSONData
                                                 encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@", JSONString);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self lerJSON];
    [self escreverJSON];
}

@end
