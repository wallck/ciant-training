//
//  ViewController.m
//  views
//
//  Created by Wallace Goncalves de Oliveira on 24/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    int _contador;
}
@property (weak, nonatomic) IBOutlet UILabel *labelHelloWorld;
@property (weak, nonatomic) IBOutlet UILabel *labelSeguimento;
@property (weak, nonatomic) IBOutlet UILabel *labelSlider;
@property (weak, nonatomic) IBOutlet UILabel *labelSwitch;
@property (weak, nonatomic) IBOutlet UILabel *labelStepper;
@property (weak, nonatomic) IBOutlet UIButton *buttonToque;

@end

@implementation ViewController

- (IBAction)seguimentoMudou:(UISegmentedControl *)sender {
    NSInteger index = sender.selectedSegmentIndex;
    NSString *text = [NSString stringWithFormat:@"Segmento Selecionado: %li", index];
    _labelSeguimento.text = text;
}

- (IBAction)sliderMudou:(UISlider *)sender {
    NSString *text = [NSString stringWithFormat:@"Slider: %.5f", sender.value];
    _labelSlider.text = text;
}

- (IBAction)switchMudou:(UISwitch *)sender {
    NSString *text = sender.on ? @"ON" : @"OFF";
    _labelSwitch.text = [NSString stringWithFormat:@"Switch: %@", text];
}

- (IBAction)stepperMudou:(UIStepper *)sender {
    NSString *text = [NSString stringWithFormat:@"Stepper: %.5f", sender.value];
    _labelStepper.text = text;
}

- (IBAction)tocado:(UIButton *)sender {
    // _cmd é um token do método atual
    _contador++;
    
    _labelHelloWorld.text = [NSString stringWithFormat:@"Tocou %d Vezes", _contador];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_labelHelloWorld setText:@"Tocou X Vezes"];
    // ou
    // _labelHelloWorld.text
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end