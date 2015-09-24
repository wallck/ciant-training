//
//  PrimeiroViewController.m
//  presentViewConstroller
//
//  Created by Wallace Goncalves de Oliveira on 25/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "PrimeiroViewController.h"

@interface PrimeiroViewController ()

@end

#define SEGUNDA_TELA_SEGUE_ID @"MostrarSegundaTelaID"

@implementation PrimeiroViewController

- (IBAction)proximaTelaTouchedUpInside:(UIButton *)sender {

    // Troca de tela via Segue
    
    [self performSegueWithIdentifier:SEGUNDA_TELA_SEGUE_ID sender:sender];
}

@end
