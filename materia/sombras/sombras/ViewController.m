//
//  ViewController.m
//  sombras
//
//  Created by Wallace Goncalves de Oliveira on 08/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    
}

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *views;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self colocarSombra];
    [self colocarSombraTrapezoidal];
    [self colocarSombraEfeitoAlbum];
}

-(void)colocarSombra {
    UIView *view = [_views firstObject];
    CALayer *layer = view.layer;
    
    layer.shadowColor = [[UIColor blackColor] CGColor];
    layer.shadowOpacity = 0.7;
    layer.shadowOffset = CGSizeMake(0, 10);
    layer.shadowRadius = 15;
}

// Sombras com formas
// Trapezoidal
//   ____
//  /    \
// /______\
//
-(void)colocarSombraTrapezoidal{
    UIView *view = _views[1];
    CALayer *layer = view.layer;
    
    layer.shadowColor = [[UIColor blackColor] CGColor];
    layer.shadowOpacity = 0.7;
    
    // desenho do trapezio
    UIBezierPath *trapezio = [UIBezierPath bezierPath];
    
    // Anda com a "ponta da caneta"
    [trapezio moveToPoint:CGPointMake(view.frame.size.width * 0.33, view.frame.size.height * 0.66)];
    
    // Desenha as linhas
    //   ____
    [trapezio addLineToPoint:CGPointMake(view.frame.size.width * 0.66, view.frame.size.height * 0.66)];
    
    //   ____
    //  /
    // /
    [trapezio addLineToPoint:CGPointMake(view.frame.size.width * 1.15, view.frame.size.height * 1.15)];
    
    //   ____
    //  /
    // /_______
    [trapezio addLineToPoint:CGPointMake(view.frame.size.width * -0.15, view.frame.size.height * 1.15)];
    
    // O restante do trapezio é completado automaticamente
    // O UIBezierPath sempre fecha o polígono
    
    layer.shadowPath = trapezio.CGPath;
}

-(void)colocarSombraEfeitoAlbum {
    UIView *view = [_views lastObject];
    CALayer *layer = view.layer;
    
    layer.shadowColor   = [[UIColor blackColor] CGColor];
    layer.shadowOpacity = 0.85; // 0.0 -> 1.0
    
    // efeito album
    // constantes de configuração
    CGFloat fatorDobra = 15.0;
    CGFloat profundidadeSombra = 10.0;
    
    // desenhando :)
    UIBezierPath *efeitoAlbum = [UIBezierPath bezierPath];
    [efeitoAlbum moveToPoint:CGPointMake(0.0, 0.0)];
    
    // linha horizontal superior
    [efeitoAlbum addLineToPoint:CGPointMake(view.bounds.size.width, 0)];
    
    // linha vertical direita
    [efeitoAlbum addLineToPoint:CGPointMake(view.bounds.size.width,
                                            view.bounds.size.height + profundidadeSombra)];
    
    // curva para efeito album
    [efeitoAlbum addCurveToPoint:CGPointMake(0.0,
                                             view.bounds.size.height + profundidadeSombra)
                   controlPoint1:CGPointMake(
                                             view.bounds.size.width  - fatorDobra,
                                             view.bounds.size.height + profundidadeSombra - fatorDobra)
                   controlPoint2:CGPointMake(
                                             fatorDobra,
                                             view.bounds.size.height + profundidadeSombra - fatorDobra
                                             )];
    
    layer.shadowPath = efeitoAlbum.CGPath;
}

@end
