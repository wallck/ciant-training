//
//  ViewController.m
//  fabrica
//
//  Created by Wallace Goncalves de Oliveira on 16/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"
#import <DigitsKit/DigitsKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     DESTA FORMA OU PELO 'customLogin'
     
    DGTAuthenticateButton *authenticateButton = [DGTAuthenticateButton buttonWithAuthenticationCompletion:^(DGTSession *session, NSError *error) {
        if (session) {
            NSLog(@"Phone number: %@", session.phoneNumber);
            NSLog(@"UserID: %@", session.userID);
        }
    }];
    
    authenticateButton.center = self.view.center;
    
    [self.view addSubview:authenticateButton];
     */
}

- (IBAction)customLogin:(UIButton *)sender {
    DGTAppearance *appearance = [DGTAppearance new];
    appearance.backgroundColor = [UIColor blackColor];
    appearance.accentColor = [UIColor orangeColor];
    
    [Digits.sharedInstance authenticateWithDigitsAppearance:appearance
                                             viewController:nil
                                                      title:nil
                                                 completion:^(DGTSession *session, NSError *error) {
                                                     if (session) {
                                                         NSLog(@"Phone number: %@", session.phoneNumber);
                                                         NSLog(@"UserID: %@", session.userID);
                                                     }
                                                 }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
