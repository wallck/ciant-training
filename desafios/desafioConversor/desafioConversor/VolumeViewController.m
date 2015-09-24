//
//  FifthViewController.m
//  desafioConversor
//
//  Created by Wallace Goncalves de Oliveira on 26/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "VolumeViewController.h"
#import "VolumeConversor.h"

@interface VolumeViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textFieldLitros;
@property (weak, nonatomic) IBOutlet UITextField *textFieldGaloes;
@property (weak, nonatomic) IBOutlet UITextField *textFieldMetrosCubicos;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCentimetrosCubicos;

@end

@implementation VolumeViewController

- (IBAction)calcularTouched:(id)sender {
    double litros = [_textFieldLitros.text doubleValue];
    
    VolumeConversor *mc = [VolumeConversor newComValorEmLitros:[NSNumber numberWithDouble: litros]];
    
    NSNumber *galoes = [mc paraGaloes];
    NSNumber *metroCubico = [mc paraMetroCubico];
    NSNumber *centimentroCubico = [mc paraCentimetroCubico];
    
    _textFieldGaloes.text = [NSString stringWithFormat:@"%.2f", galoes.doubleValue];
    _textFieldMetrosCubicos.text = [NSString stringWithFormat:@"%.10f", metroCubico.doubleValue];
    _textFieldCentimetrosCubicos.text = [NSString stringWithFormat:@"%.10f", centimentroCubico.doubleValue];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
