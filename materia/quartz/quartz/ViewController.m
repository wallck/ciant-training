//
//  ViewController.m
//  quartz
//
//  Created by Wallace Goncalves de Oliveira on 08/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController () {
    
}

@property (weak, nonatomic) IBOutlet UIView *viewAzul;
@property (weak, nonatomic) IBOutlet UIView *viewLaranja;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation ViewController

- (IBAction)sliderMoveu:(UISlider *)sender {
    // controle de cornerRadius
    CGFloat altura = _viewAzul.frame.size.height / 2.0;
    altura *= sender.value;
    [_viewAzul.layer setCornerRadius:altura];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Apesar do framewoek ser QuartzCore
    // o prefixo das classes é CA (CoreAnimation)
    
    CALayer *layer = _viewAzul.layer;
    layer.borderColor = [[UIColor blackColor] CGColor];
    layer.borderWidth = 1.0;
    
    [self criarPonteiros];
}

-(CALayer*)criarPonteiroComAltura:(CGFloat)altura cor:(UIColor*)cor {
    CALayer *ponteiro = [CALayer layer];
    
    if (!cor)
        ponteiro.backgroundColor = [[UIColor blackColor] CGColor];
    else
        ponteiro.backgroundColor = [cor CGColor];
    
    // TODO: posição y
    [ponteiro setFrame:CGRectMake(0, 0, 2, altura)];
    // TODO: API/2-1
    [ponteiro setAnchorPoint:CGPointMake(0.5, 1)];
    
    return ponteiro;
}

-(CGRect)frameCentroDoPonteiro:(CGRect)framePonteiro viewRelativa:(UIView*)frameView {
    CGRect rect = framePonteiro;
    rect.origin.x = frameView.frame.size.width / 2.0;
    rect.origin.y = (frameView.frame.size.height / 2.0) - framePonteiro.size.height;
    return rect;
}

-(CABasicAnimation*)criarAnimacaoPonteiroComInicial:(CGFloat)inicial tempo:(CFTimeInterval)tempo {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    [animation setFromValue:@(inicial)];
    
    // toValue -> anima até o valor
    //[animation setToValue:@(0)];
    
    // byValue = anima incrementando o valor
    [animation setByValue:@(M_PI * 2.0)];
    
    // duração da animação
    [animation setDuration:tempo];
    
    // repetição
    [animation setRepeatCount:INFINITY];
    
    return animation;
}
/*
private func atualizaRelogio() {
    let df = NSDateFormatter();

    let tempoString = df.stringFromDate(NSDate());
    let tempoArray = tempoString.componentsSeparatedByString(":");
}
*/
-(void)updateTimeLabel {
    NSDateFormatter *df = [NSDateFormatter new];
    df.dateFormat = @"hh:mm:ss";
    _timeLabel.text = [df stringFromDate:[NSDate new]];
}

-(void)criarPonteiros {
    CALayer *hora = [self criarPonteiroComAltura:60 cor:[UIColor yellowColor]];
    CALayer *minuto = [self criarPonteiroComAltura:80 cor:[UIColor redColor]];
    CALayer *segundo = [self criarPonteiroComAltura:100 cor:[UIColor blackColor]];
    
    hora.frame = [self frameCentroDoPonteiro:hora.frame viewRelativa:_viewLaranja];
    minuto.frame = [self frameCentroDoPonteiro:minuto.frame viewRelativa:_viewLaranja];
    segundo.frame = [self frameCentroDoPonteiro:segundo.frame viewRelativa:_viewLaranja];
    
    [_viewLaranja.layer addSublayer:segundo];
    [_viewLaranja.layer addSublayer:minuto];
    [_viewLaranja.layer addSublayer:hora];
    
    // Primeira chamada para atualizar o label
    [self updateTimeLabel];
    
    // Atualizando o label de 1 em 1 segundo
    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(updateTimeLabel)
                                   userInfo:nil
                                    repeats:YES];
    
    int h = [_timeLabel.text substringWithRange:NSMakeRange(0, 2)].intValue;
    int m = [_timeLabel.text substringWithRange:NSMakeRange(3, 2)].intValue;
    int s = [_timeLabel.text substringWithRange:NSMakeRange(6, 2)].intValue;
    
    // cria animações
    CABasicAnimation *seguAnim = [self criarAnimacaoPonteiroComInicial: s * (M_PI * 2.0) / 60 tempo:60];
    [segundo addAnimation:seguAnim forKey:nil];
    CABasicAnimation *minuAnim = [self criarAnimacaoPonteiroComInicial: (m + s / 60.0) * (M_PI * 2.0) / 60 tempo:60*60];
    [minuto addAnimation:minuAnim forKey:nil];
    CABasicAnimation *horaAnim = [self criarAnimacaoPonteiroComInicial: (h + m / 60.0 + s / 3600.0) * (M_PI * 2.0) / 12 tempo:60*60*60];
    [hora addAnimation:horaAnim forKey:nil];
    
    // bordar arredondada no relogio
    CABasicAnimation *cantos = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    [cantos setToValue:@(_viewLaranja.frame.size.height / 2.0)];
    [cantos setDuration:5];
    // mantendo o estado da animacao quando ela acabar
    [cantos setRemovedOnCompletion:NO];
    [cantos setFillMode:kCAFillModeForwards];
    [_viewLaranja.layer addAnimation:cantos forKey:nil];
}

@end
