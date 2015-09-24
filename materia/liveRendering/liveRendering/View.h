//
//  View.h
//  liveRendering
//
//  Created by Wallace Goncalves de Oliveira on 08/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE // marca a classe como "desenhavel" pelo storyboard
@interface View : UIView

// IBInspectable marca a propriedade como "inspecionavel"
// aparecendo no menu inspector do storyboard
@property (nonatomic) IBInspectable UIColor *fillColor;
@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable CGFloat borderWidth;

@end
