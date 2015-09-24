//
//  ViewController.m
//  motionEffects
//
//  Created by Wallace Goncalves de Oliveira on 03/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *squareView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // UIMotionEffect -> Abstrato
    
    UIInterpolatingMotionEffect *effect = [[UIInterpolatingMotionEffect alloc]
                                           initWithKeyPath:@"center.x"
                                           type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    
    [effect setMinimumRelativeValue:@-50];
    [effect setMaximumRelativeValue:@50];
    
    [_squareView addMotionEffect:effect];
    
    // Sombra
    
    UIInterpolatingMotionEffect *shadowEffect = [[UIInterpolatingMotionEffect alloc]
                                           initWithKeyPath:@"layer.shadowOffset"
                                           type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    
    NSValue *minValue = [NSValue valueWithCGSize:CGSizeMake(-10, 5)];
    NSValue *maxValue = [NSValue valueWithCGSize:CGSizeMake(10, 5)];
    [shadowEffect setMinimumRelativeValue:minValue];
    [shadowEffect setMaximumRelativeValue:maxValue];
    
    _squareView.layer.shadowOpacity = 0.9;
    [_squareView addMotionEffect:effect];
}

@end
