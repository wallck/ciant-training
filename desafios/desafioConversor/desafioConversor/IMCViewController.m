//
//  FourthViewController.m
//  desafioConversor
//
//  Created by Wallace Goncalves de Oliveira on 26/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "IMCViewController.h"
#import "IMC.h"

@interface IMCViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textFieldAltura;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPeso;
@property (weak, nonatomic) IBOutlet UITextField *textFieldIMC;

@end

@implementation IMCViewController

- (IBAction)calcularTouched:(UIButton *)sender {
    double altura = [_textFieldAltura.text doubleValue];
    double peso = [_textFieldPeso.text doubleValue];
    
    NSNumber *imc = [IMC calcularComPeso:[NSNumber numberWithDouble: peso] eAltura: [NSNumber numberWithDouble: altura]];
    
    _textFieldIMC.text = [NSString stringWithFormat:@"%.2f", imc.doubleValue];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
