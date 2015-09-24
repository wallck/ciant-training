//
//  ViewController.m
//  kitDynamics
//
//  Created by Wallace Goncalves de Oliveira on 03/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController {
    // elementos
    NSMutableArray *_circulos;
    
    // animador
    UIDynamicAnimator *_animator;
    
    // comportamentos
    // classe Abstrada
    // UIDynamicBehavior
    UIGravityBehavior *_gravity;
    UICollisionBehavior *_collision;
}

-(void)criarCirculo:(CGRect) rect {
    if (!_circulos)
        _circulos = [NSMutableArray array];
    
    UIView *c = [[UIView alloc] initWithFrame:rect];
    [c setBackgroundColor:[UIColor blueColor]];
    c.layer.cornerRadius = rect.size.width / 2.0;
    [_circulos addObject:c];
    [self.view addSubview:c];
}

-(void)criarAnimator {
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    // prepara os comportamentos
    _gravity = [[UIGravityBehavior alloc] initWithItems:_circulos];
    //[_gravity setGravityDirection:CGVectorMake(<#CGFloat dx#>, <#CGFloat dy#>)];
    
    _collision = [[UICollisionBehavior alloc] initWithItems:_circulos];
    [_collision setTranslatesReferenceBoundsIntoBoundary:YES];
    
    // adicionar behavior
    [_animator addBehavior:_gravity];
    [_animator addBehavior:_collision];
}

-(void)criarBotaoSnap {
    UIButton *b = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [b addTarget:self
          action:@selector(snap)
forControlEvents:UIControlEventTouchUpInside];
    
    [b setTitle:@"Snap" forState:UIControlStateNormal];
    b.frame = CGRectMake(0, 0, 100, 30);
    b.center = self.view.center;
    
    [self.view addSubview:b];
}

-(void)snap {
    UISnapBehavior *snap = [[UISnapBehavior alloc]
                            initWithItem:_circulos[1]
                            snapToPoint:self.view.center];
 
    snap.damping = 0;
    [_animator addBehavior:snap];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self criarCirculo:CGRectMake(10, 50, 50, 50)];
    [self criarCirculo:CGRectMake(25, 150, 50, 50)];
    [self criarCirculo:CGRectMake(45, 230, 50, 50)];
    
    [self criarAnimator];
    [self criarBotaoSnap];
}

@end
