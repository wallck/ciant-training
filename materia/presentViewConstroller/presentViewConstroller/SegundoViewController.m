//
//  SegundoViewController.m
//  presentViewConstroller
//
//  Created by Wallace Goncalves de Oliveira on 25/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "SegundoViewController.h"
#import "TerceiroViewController.h"

#define TERCEIRO_VIEW_CONTROLLER_ID @"TerceiroViewControllerID"

@implementation SegundoViewController

- (IBAction)proximaTelaTouchedUpInside:(UIButton *)sender {

    // Troca de tela via ViewConstroller (classe)
    // nota: precisamos instanciar via storyboard senão não teremos a tela
    //       e sim um ViewConstroller em branco
    
    TerceiroViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:TERCEIRO_VIEW_CONTROLLER_ID];
    [self presentViewController:vc animated:YES completion:nil];
}


@end
