//
//  ViewController.m
//  pickerView
//
//  Created by Wallace Goncalves de Oliveira on 01/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewViewController.h"

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

@interface ViewViewController () <UIPickerViewDelegate, UIPickerViewDataSource> {
    NSArray *_estados;
}

@property (copy) NSArray *imagens;

@end

@implementation ViewViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    _estados = [ESTADOS.allKeys copy];
    
    NSMutableArray *imagens = [NSMutableArray array];
    for (int i = 1; i < 6; i++) {
        [imagens addObject:[NSString stringWithFormat:@"badge%d", i]];
    }
    
    // self.imagens é uma property (copy), por isto ela copia o array e não a referência
    self.imagens = imagens;
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
//-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
//    return @"";
//}

// 2 - Este método tem a segunda maior prioridade na geração dos elementos, quando implementado
//     e quando retorna algo diferente de nil
//-(NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
//    return nil;
//}

#define IMAGE_FRAME CGRectMake(0, 0, 50, 50)

// 3 - Este método tem maior prioridade na geração dos elementos, quando implementado
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {

    // reutilizando a view
    UIImageView *imageView = (UIImageView*)view;
    
    if (!imageView) {
        imageView = [[UIImageView alloc] initWithFrame:IMAGE_FRAME];
        [imageView setContentMode:UIViewContentModeScaleAspectFit];
    }
    
    NSString *imageName = [self.imagens objectAtIndex:row];
    UIImage *image = [UIImage imageNamed:imageName];
    imageView.image = image;
    
    return imageView;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return IMAGE_FRAME.size.height;
}

#pragma mark - UIPickerViewDelegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == PickerComponentEstados)
        [pickerView reloadComponent:PickerComponentCidades];
}

@end
