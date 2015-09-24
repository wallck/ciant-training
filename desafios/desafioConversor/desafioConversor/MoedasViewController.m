//
//  ThirdViewController.m
//  desafioConversor
//
//  Created by Wallace Goncalves de Oliveira on 26/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "MoedasViewController.h"
#import "MoedasConversor.h"

@interface MoedasViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textFieldReais;
@property (weak, nonatomic) IBOutlet UITextField *textFieldDolares;
@property (weak, nonatomic) IBOutlet UITextField *textFieldEuros;
@property (weak, nonatomic) IBOutlet UITextField *textFieldLibras;

@end

@implementation MoedasViewController

- (IBAction)calcularTouched:(UIButton *)sender {
    double reais = [_textFieldReais.text doubleValue];
    
    MoedasConversor *mc = [MoedasConversor newComValorEmReais:[NSNumber numberWithDouble: reais]];
    
    NSNumber *dollar = [mc paraDollar];
    NSNumber *euros = [mc paraEuro];
    NSNumber *libras = [mc paraLibra];
    
    _textFieldDolares.text = [NSString stringWithFormat:@"%.2f", dollar.doubleValue];
    _textFieldEuros.text = [NSString stringWithFormat:@"%.2f", euros.doubleValue];
    _textFieldLibras.text = [NSString stringWithFormat:@"%.2f", libras.doubleValue];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end