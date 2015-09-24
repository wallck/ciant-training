//
//  View.m
//  liveRendering
//
//  Created by Wallace Goncalves de Oliveira on 08/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "View.h"

@implementation View

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIBezierPath *oval = [UIBezierPath bezierPathWithOvalInRect:rect];
    
    [_borderColor setStroke];
    [oval setLineWidth:self.borderWidth];
    [oval stroke];
    
    [_fillColor setFill];
    [oval fill];
}

@end
