//
//  ViewController.m
//  gestos
//
//  Created by Wallace Goncalves de Oliveira on 03/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    
}

@property (nonatomic) UIView *quadrado;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *whiteSquareView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    view.center = self.view.center;
    view.layer.borderColor = [[UIColor blueColor] CGColor];
    view.layer.borderWidth = 1;
    _quadrado = view;
    [self.view addSubview:view];
    
    // Adicionando um detector de Toques
    // Classe Abstrata
    // Leia a documentação para descobrir os gestos disponíveis
    // Classe: UIGestureRecognizer
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self action:@selector(tapGesture:)];
    
    // podemos configurar o tap (3 toques com 2 dedos)
    [tap setNumberOfTapsRequired:3]; // Número de toques
    [tap setNumberOfTouchesRequired:2]; // Toque com três dedos
    [_quadrado addGestureRecognizer:tap];
}

-(void)tapGesture:(UIGestureRecognizer *)gesture {
    NSLog(@"tapped");
}

- (IBAction)swipeGesture:(UISwipeGestureRecognizer *)sender {
    _topView.layer.backgroundColor = [[UIColor whiteColor] CGColor];
}

- (IBAction)pinchGesture:(UIPinchGestureRecognizer *)sender {
    /*
    CGRect tamanho = _whiteSquareView.frame;
    tamanho.size.width *= sender.scale;
    tamanho.size.height *= sender.scale;
    
    CGPoint centro = _whiteSquareView.center;
    _whiteSquareView.frame = tamanho;
    _whiteSquareView.center = centro;
    */
    
    // OU
    
    _whiteSquareView.transform = CGAffineTransformMakeScale(sender.scale, sender.scale);
}

@end
