//
//  ViewController.m
//  networking
//
//  Created by Wallace Goncalves de Oliveira on 10/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"
#import "Connection.h"
#import "Session.h"
#import "AlamoFire.h"

@interface ViewController () {
    id<Networking> _net[3];
    NSArray<Networking> *_n;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _net[0] = [Connection new];
    _net[1] = [Session new];
    _net[2] = [AlamoFire new];
    
    // GET
    [_net[0] GET];
    [_net[1] GET];
    [_net[2] GET];
    
    // POST
    [_net[0] POST];
    [_net[1] POST];
    [_net[2] POST];
}

- (void)GET {
    
}

- (void)POST {
    
}

@end
