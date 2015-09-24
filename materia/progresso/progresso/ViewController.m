//
//  ViewController.m
//  progresso
//
//  Created by Wallace Goncalves de Oliveira on 26/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (weak, nonatomic) IBOutlet UIProgressView *progress;

@end

@implementation ViewController

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Spinner (activityIndicator)
    [self performSelector:@selector(ligarSpinner) withObject:nil afterDelay:5];
    
    // Progress Bar (progress)
    [self incrementaProgresso];
}

-(void)ligarSpinner {
    [self.activityIndicator startAnimating];
    
    [self performSelector:@selector(desligaSpinner) withObject:nil afterDelay:5];
}
-(void)desligaSpinner {
    [self.activityIndicator stopAnimating];
    [self performSelector:@selector(ligarSpinner) withObject:nil afterDelay:5];
}

-(void)incrementaProgresso {
    // chegar se progresso é 100%
    if (self.progress.progress >= 1)
        return;
    
    // incrementar
    self.progress.progress += 0.001;
    
    // agendar chamada para 1 segundo
    [self performSelector:@selector(incrementaProgresso) withObject:nil afterDelay:0.01];
}

@end
