//
//  ViewController.m
//  toques
//
//  Created by Wallace Goncalves de Oliveira on 03/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    CGPoint _centerOffset;
    BOOL _touching;
}

@property (weak, nonatomic) IBOutlet UIView *viewQuadrado;

@end

@implementation ViewController

-(CGPoint)anyTouchLocation:(NSSet*)touches {
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:nil];
    return touchLocation;
}

CGPoint CGPointDifferenceToPoint(CGPoint p1, CGPoint p2) {
    return CGPointMake(p1.x - p2.x, p1.y - p2.y);
}

CGPoint CGPointAddPoint(CGPoint p1, CGPoint p2) {
    return CGPointMake(p1.x + p2.x, p1.y + p2.y);
}

#pragma mark - Touches

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint touchLocation = [self anyTouchLocation:touches];
    _touching = CGRectContainsPoint(_viewQuadrado.frame, touchLocation);
    _centerOffset = CGPointDifferenceToPoint(_viewQuadrado.center, touchLocation);
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {

    if (_touching) {
        CGPoint touchLocation = [self anyTouchLocation:touches];
        _viewQuadrado.center = CGPointAddPoint(touchLocation, _centerOffset);
    }
    
    //NSLog(@"%@", NSStringFromSelector(_cmd));
    //NSLog(@"%@", touches);
}

/*
    NOTA: Função útil com toques
          é remover o teclado ao tocar
          na tela
*/
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {

    /*
        EXEMPLO: [_textField resignFirstResponder];
     */
    
    _touching = NO;
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    _touching = NO;
}

@end
