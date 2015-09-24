//
//  ViewController.m
//  pickerView
//
//  Created by Wallace Goncalves de Oliveira on 01/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"

typedef NS_ENUM(NSUInteger, PickerComponent) {
    PickerComponentEstados = 0,
    PickerComponentCidades,
    
    PickerComponentMax
};

#define ESTADOS @{ \
    @"RS": @[ @"Porto Alegre" ], \
    @"SP": @[ @"São Paulo", @"Santos" ], \
    @"RJ": @[ @"Rio de Janeiro", @"Angra dos Reis" ], \
    @"MG": @[ @"Belo Horizonte", @"Betim", @"Contagem", @"Brumadinho", @"Nova Lima" ] \
}

@interface ViewController () <UIPickerViewDelegate, UIPickerViewDataSource> {
    NSArray *_estados;
}

@end

@implementation ViewController

-(void)viewDidLoad {
    _estados = [ESTADOS.allKeys copy];
}

-(NSArray*) cidadesFromEstado:(UIPickerView*)pickerView {
    NSUInteger indexEstado = [pickerView selectedRowInComponent:PickerComponentEstados];
    NSString *estadoSelecionado = _estados[indexEstado];
    NSArray *cidades = [ESTADOS objectForKey:estadoSelecionado];
    return cidades;
}

#pragma mark - UIPickerViewDataSource

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return PickerComponentMax;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == PickerComponentEstados) {
        return _estados.count;
    } else {
        NSArray *cidades = [self cidadesFromEstado:pickerView];
        return cidades.count;
    }
}

// 1 - Este método possui a menos prioridade na geração dos elementos, quando implementado
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == PickerComponentEstados) {
        return _estados[row];
    } else {
        NSArray *cidades = [self cidadesFromEstado:pickerView];
        return cidades[row];
    }
}

// 2 - Este método tem a segunda maior prioridade na geração dos elementos, quando implementado
//     e quando retorna algo diferente de nil
//-(NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
//    return [[NSAttributedString alloc] initWithString: @"Linha2"];
//}

// 3 - Este método tem maior prioridade na geração dos elementos, quando implementado
//-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
//    return nil;
//}

#pragma mark - UIPickerViewDelegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == PickerComponentEstados)
        [pickerView reloadComponent:PickerComponentCidades];
}

@end
