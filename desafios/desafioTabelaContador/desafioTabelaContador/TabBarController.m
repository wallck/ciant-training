//
//  TabBarController.m
//  desafioTabelaContador
//
//  Created by Wallace Goncalves de Oliveira on 28/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "TabBarController.h"
#import "Contador.h"

@interface TabBarController ()
@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    _contador = [Contador new];
    
}

@end
