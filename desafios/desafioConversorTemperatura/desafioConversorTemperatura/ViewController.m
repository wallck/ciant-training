//
//  ViewController.m
//  desafioConversorTemperatura
//
//  Created by Wallace Goncalves de Oliveira on 24/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"
#import "Temperatura.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentEntrada;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentSaida;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTemperatura;
@property (weak, nonatomic) IBOutlet UILabel *labelResultado;

@end

@implementation ViewController

- (void)processarTemperatura {
    NSUInteger entrada = _segmentEntrada.selectedSegmentIndex;
    NSUInteger saida = _segmentSaida.selectedSegmentIndex;
    double temperatura = [_textFieldTemperatura.text doubleValue];
    
    double temperaturaConvertida = [Temperatura convert:temperatura from:entrada to:saida];
    char charType = saida == TemperatureTypeCelcius ? 'C' : saida == TemperatureTypeFahrenheit ? 'F' : 'K';
    
    _labelResultado.text = [NSString stringWithFormat:@"%.1f ˚%c", temperaturaConvertida, charType];
}

- (IBAction)segmentEntradaChanged:(UISegmentedControl *)sender {
    [self processarTemperatura];
}

- (IBAction)temperaturaChanged:(UITextField *)sender {
    [self processarTemperatura];
}

// implementado do Delegate UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *) textField {
    [self processarTemperatura];
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear: animated];
    
    // sempre abrir o teclado quando entrar na tela
    [_textFieldTemperatura becomeFirstResponder];
}

@end
