//
//  ViewController.m
//  desafioStackView
//
//  Created by Wallace Goncalves de Oliveira on 23/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIStackView *stackViewCabras;

@end

@implementation ViewController

- (IBAction)adicionarCabra:(UIButton *)sender {
    UIImageView *goat = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"goat-512"]];
    goat.contentMode = UIViewContentModeScaleAspectFit;

    [_stackViewCabras addArrangedSubview:goat];
    
    [UIView animateWithDuration:0.25 animations:^{
        [_stackViewCabras layoutIfNeeded];
    }];
}

- (IBAction)removerCabra:(UIButton *)sender {
    if (_stackViewCabras.arrangedSubviews.count > 0) {
        UIImageView *goat = [_stackViewCabras.arrangedSubviews lastObject];
        [_stackViewCabras removeArrangedSubview:goat];
        [goat removeFromSuperview];
        
        [UIView animateWithDuration:0.25 animations:^{
            [_stackViewCabras layoutIfNeeded];
        }];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

@end
