//
//  ViewController.m
//  desafioRGB
//
//  Created by Wallace Goncalves de Oliveira on 24/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISlider *sliderRed;
@property (weak, nonatomic) IBOutlet UISlider *sliderGreen;
@property (weak, nonatomic) IBOutlet UISlider *sliderBlue;
@property (weak, nonatomic) IBOutlet UISlider *sliderAlpha;

@property (weak, nonatomic) IBOutlet UILabel *labelHEX;
@property (weak, nonatomic) IBOutlet UILabel *labelRed;
@property (weak, nonatomic) IBOutlet UILabel *labelGreen;
@property (weak, nonatomic) IBOutlet UILabel *labelBlue;
@property (weak, nonatomic) IBOutlet UILabel *labelAlpha;

@property (weak, nonatomic) IBOutlet UIView *viewColor;

@end

@implementation ViewController

- (IBAction)sliderRGBChanged:(UISlider *)sender {
    float red = _sliderRed.value / 255;
    float green = _sliderGreen.value / 255;
    float blue = _sliderBlue.value / 255;
    float alpha = _sliderAlpha.value / 255;
    
    _viewColor.backgroundColor = [UIColor colorWithRed:red
                                                 green:green
                                                  blue:blue
                                                 alpha:alpha];
    
    _labelHEX.text = [NSString stringWithFormat:@"HEX: %02X%X%X%X",
                      (int)_sliderRed.value,
                      (int)_sliderGreen.value,
                      (int)_sliderBlue.value,
                      (int)_sliderAlpha.value];
    
    _labelRed.text = [NSString stringWithFormat:@"R(%03d)", (int)_sliderRed.value];
    _labelGreen.text = [NSString stringWithFormat:@"G(%03d)", (int)_sliderGreen.value];
    _labelBlue.text = [NSString stringWithFormat:@"B(%03d)", (int)_sliderBlue.value];
    _labelAlpha.text = [NSString stringWithFormat:@"A(%03d)", (int)_sliderAlpha.value];
}

- (IBAction)randomColor:(UIButton *)sender {
    
    float red = arc4random_uniform(256);
    float green = arc4random_uniform(256);
    float blue = arc4random_uniform(256);
    float alpha = arc4random_uniform(256);
    
    [[self sliderRed] setValue:red animated:YES];
    [[self sliderGreen] setValue:green animated:YES];
    [[self sliderBlue] setValue:blue animated:YES];
    [[self sliderAlpha] setValue:alpha animated:YES];
    
    [self sliderRGBChanged: nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
