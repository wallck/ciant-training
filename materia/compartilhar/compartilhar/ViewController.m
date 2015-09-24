//
//  ViewController.m
//  compartilhar
//
//  Created by Wallace Goncalves de Oliveira on 10/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    
}

@end

@implementation ViewController

- (IBAction)compartilhar:(UIButton *)sender {

    NSArray *itens = @[ [NSURL URLWithString:@"https://google.com"] ];
    
    UIActivityViewController *share = [[UIActivityViewController alloc]
                                       initWithActivityItems:itens
                                       applicationActivities:nil];
    
    // excluindo atividades
    share.excludedActivityTypes = @[ UIActivityTypePostToFacebook ];
    
    // se é iPad, apresenta de maneira diferente
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        share.modalPresentationStyle = UIModalPresentationPopover;
        share.popoverPresentationController.sourceView = sender;
        share.popoverPresentationController.sourceRect = sender.bounds;
    }
    
    [self presentViewController:share animated:YES completion:nil];
}

@end
