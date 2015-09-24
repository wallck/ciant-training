//
//  ViewController.m
//  desafioTabelaContador
//
//  Created by Wallace Goncalves de Oliveira on 28/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"
#import "Contador.h"
#import "TabBarController.h"

@interface ViewController () {
    Contador *_contador;
}

@property (weak, nonatomic) IBOutlet UILabel *labelNumero;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TabBarController *tab = (TabBarController*)self.tabBarController;
    _contador   = tab.contador;
}

- (IBAction)menosTouched:(id)sender {
    [self atualizaLabel:-1];
}

- (IBAction)maisTouched:(id)sender {
    [self atualizaLabel:1];
}

- (IBAction)zerarTouched:(id)sender {
    [self atualizaLabel:0];
}

-(void)atualizaLabel:(int)v {
    switch (v) {
        case -1 : [_contador __menosUm];    break;
        case 1  : [_contador __maisUm];     break;
        default : [_contador __zerar];      break;
    }
    
    _labelNumero.text = [NSString stringWithFormat:@"%03d", _contador.intValue];
}

@end
