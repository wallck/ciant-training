//
//  FirstViewController.m
//  desafioConversor
//
//  Created by Wallace Goncalves de Oliveira on 26/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//


//  7 Tabs (5 Tabs na verdade)
//
//  Conversões
//    - Metricas
//      - digitar metros
//      - botao conversor
//      - labels:
//        - km, cm, ft, yd
//    - Idade Canina
//      - degitar idade canina
//      - labels:
//        - idade * 7
//        - maneira "Correta" i < 2 ? *= 10 : *4
//    - Moedas:
//      - digitar real
//      - labels:
//        - dolar (*3.7)
//        - euro (*4.0)
//        - libra (*5.0)
//    - IMC
//      - digitar peso e altura
//      - label:
//        - imc -> peso / altura * 2
//    - Volume
//      - digitar litros
//      - labels:
//        - galoes
//        - m^3
//        - cm^3

#import "MetricasViewController.h"
#import "MetricasConversor.h"

@interface MetricasViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textFieldMetros;
@property (weak, nonatomic) IBOutlet UITextField *textFieldKilometros;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCentimetros;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPes;
@property (weak, nonatomic) IBOutlet UITextField *textFieldJardas;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation MetricasViewController

- (IBAction)calcularTouched:(UIButton *)sender {

    [self performSelector:@selector(ligarSpinner) withObject:nil afterDelay:2];
    
    double metros = [_textFieldMetros.text doubleValue];
    
    MetricasConversor *mc = [MetricasConversor newComValorEmMetros:[NSNumber numberWithDouble: metros]];
    
    NSNumber *kilometros = [mc paraKilometros];
    NSNumber *centimentros = [mc paraCentimetros];
    NSNumber *pes = [mc paraFeets];
    NSNumber *jardas = [mc paraYards];
    
    _textFieldKilometros.text = [NSString stringWithFormat:@"%.2f", kilometros.doubleValue];
    _textFieldCentimetros.text = [NSString stringWithFormat:@"%.2f", centimentros.doubleValue];
    _textFieldPes.text = [NSString stringWithFormat:@"%.2f", pes.doubleValue];
    _textFieldJardas.text = [NSString stringWithFormat:@"%.2f", jardas.doubleValue];
}

-(void)ligarSpinner {
    [self.spinner startAnimating];
    [self performSelector:@selector(desligaSpinner) withObject:nil afterDelay:2];
}
-(void)desligaSpinner {
    [self.spinner stopAnimating];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self
     desligaSpinner];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
