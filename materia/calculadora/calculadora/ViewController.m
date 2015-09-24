//
//  ViewController.m
//  calculadora
//
//  Created by Wallace Goncalves de Oliveira on 27/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    double              __resultStack[2];
    NSUInteger          __currentSignal;
    BOOL                __clearDisplayOnSignalTouched;
    NSMutableString     *__display;
    NSNumberFormatter   *__formatter;
}

@property (weak, nonatomic) IBOutlet UILabel *labelResult;
@end

@implementation ViewController

-(void)viewDidLoad {
    
    __clearDisplayOnSignalTouched = NO;
    __currentSignal = -1;
    
    __formatter = [[NSNumberFormatter alloc] init];
    __formatter.maximumIntegerDigits = 8;
    __formatter.minimumIntegerDigits = 1;
    __formatter.maximumFractionDigits = 8;
    
    [self resetResultStack];
    [self updateDisplay];
    [self updateResult];
}

- (IBAction)numberTouched:(UIButton *)sender {
    int number = (int)sender.tag;
    
    if (number == 0 && __display.intValue == 0)
        return;
    else if ((__display.doubleValue == 0 && ![__display containsString:@"."]) || __clearDisplayOnSignalTouched)
        __display = [NSMutableString string];
    
    if (__clearDisplayOnSignalTouched)
        __clearDisplayOnSignalTouched = NO;
    
    [__display appendString:[NSString stringWithFormat:@"%d", number]];
    [self updateResult];
}
- (IBAction)buttonACTouched:(id)sender {
    [self resetResultStack];
    [self updateDisplay];
    [self updateResult];
}
- (IBAction)buttonChangeSignalTouched:(id)sender {
    if (__display.intValue == 0)
        return;
    
    double value = __display.doubleValue;
    NSNumber *number = [NSNumber numberWithDouble:value];
    NSString *text = [NSString stringWithFormat:@"%@", [__formatter stringFromNumber:number]];

    __display = [NSMutableString string];
    [__display appendString:text];
    __resultStack[__resultStack[0] == value ? 0 : 1] = __display.doubleValue;
    
    [self updateResult];
}
- (IBAction)buttonSignalTouched:(UIButton*)sender {
     if ([[__display substringFromIndex:__display.length - 1] isEqual:@"."])
         return;
    
    [self updateResultStackOnButtonTouched];
    [self updateResultStack:__currentSignal];
    [self updateDisplay];
    [self updateResult];
    
    __clearDisplayOnSignalTouched = YES;
    __currentSignal = sender.tag;
}
- (IBAction)buttonEqualTouched:(id)sender {
    if ([[__display substringFromIndex:__display.length - 1] isEqual:@"."])
        return;
    
    [self updateResultStackOnButtonTouched];
    [self updateResultStack:__currentSignal];
    [self updateDisplay];
    [self updateResult];
    
    __currentSignal = -1;
}
- (IBAction)buttonDotTouched:(id)sender {
    if ([__display containsString:@"."])
        return;
    
    [__display appendString:@"."];
    [self updateResult];
    
    __clearDisplayOnSignalTouched = NO;
}
-(void)resetResultStack {
    __resultStack[0] = 0;
    __resultStack[1] = 0;
}
-(void)updateResultStackOnButtonTouched {
    if (__resultStack[0] == 0)
        __resultStack[0] = __display.doubleValue;
    else
        __resultStack[1] = __display.doubleValue;
}
-(void)updateResultStack:(NSUInteger)signal {
    if (signal == -1) return;
    
    if (__resultStack[1] != 0) {
        switch (signal) {
            case 0: __resultStack[0] = (int)__resultStack[0] % (int)__resultStack[1]; break;
            case 1: __resultStack[0] /= __resultStack[1]; break;
            case 2: __resultStack[0] *= __resultStack[1]; break;
            case 3: __resultStack[0] -= __resultStack[1]; break;
            case 4: __resultStack[0] += __resultStack[1]; break;
        }
        
        __currentSignal = -1;
        __resultStack[1] = 0;
    }
}
-(void)updateDisplay {
    __display = [NSMutableString string];
    
    NSNumber *number = [NSNumber numberWithDouble:__resultStack[0]];
    NSString *text = [NSString stringWithFormat:@"%@", [__formatter stringFromNumber:number]];
    [__display appendString:text];
}
-(void)updateResult {
    _labelResult.text = __display;
}

@end