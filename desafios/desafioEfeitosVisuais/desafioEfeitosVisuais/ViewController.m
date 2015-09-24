//
//  ViewController.m
//  desafioEfeitosVisuais
//
//  Created by Wallace Goncalves de Oliveira on 01/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

/*
 
 Barra de "Navegação":
 - VisualEffects View com Blur e Vibrancy no Topo
 - SegmentedControl com nome de algumas imagens dentro
 - Botao para centralizar imagem
 - Botao para aplicar um "AspectFit" manipulando o Zoom
 
 ScrollView no fundo
 - scrollView com zoom
 
 Ao mudar o valor do segmento, troca a imagem no scrollView
 
 */

#import "ViewController.h"

@interface ViewController () {
    
}

@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadImage:_segment];
}

- (IBAction)segmentCervejaChanged:(UISegmentedControl *)sender {
    [self loadImage:sender];
    
}

-(void)loadImage:(UISegmentedControl *)segment {
    NSString *imageName = [segment titleForSegmentAtIndex:segment.selectedSegmentIndex];
    _imageView.image = [UIImage imageNamed:imageName];
}

@end
