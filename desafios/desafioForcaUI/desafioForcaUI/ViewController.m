//
//  ViewController.m
//  desafioForcaUI
//
//  Created by Wallace Goncalves de Oliveira on 24/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"

#define MAX_LIFES 7
#define SECRED_WORD @"WALLACE"

@interface ViewController () <UITextFieldDelegate> {
    
    int _currentLifes;
    NSMutableString *_maskedWord;
}

@property (weak, nonatomic) IBOutlet UITextField *textFieldChute;
@property (weak, nonatomic) IBOutlet UILabel *labelResult;
@property (weak, nonatomic) IBOutlet UILabel *labelLifes;
@property (weak, nonatomic) IBOutlet UILabel *labelStatus;

@end

@implementation ViewController

- (IBAction)retryTouched:(UIButton *)sender {
    [self resetAll];
}

- (IBAction)chuteChanged:(UITextField *)sender {
    
}
- (IBAction)tentarTouched:(UIButton *)sender {
    if ([self chute:_textFieldChute.text])
        _labelResult.text = _maskedWord;
    
    if (_currentLifes < 1)
        _labelStatus.text = @"Perdeu!";
    else if ([self ganhou])
        _labelStatus.text = @"Ganhou!";
}

-(BOOL)chute:(NSString*)letra {
    
    letra = [letra uppercaseString];
    BOOL encontrou = NO;
    
    for (int i = 0; i < SECRED_WORD.length; i++) {
        NSString *l = [SECRED_WORD substringWithRange:NSMakeRange(i, 1)];
        if ([letra isEqual:l]) {
            [_maskedWord replaceCharactersInRange:NSMakeRange(i, 1) withString:l];
            encontrou = YES;
        }
    }
    
    if (!encontrou) {
        _currentLifes--;
        [self drawLifes];
    }
    
    return encontrou;
}

-(void)drawLifes {
    NSMutableString *lifes = [NSMutableString string];
    
    for(int i = 0; i < _currentLifes; i++)
        [lifes appendString:@"❤️"];
    
    for(int i = 0; i < MAX_LIFES - _currentLifes; i++)
        [lifes appendString:@"💔"];
    
    _labelLifes.text = lifes;
}
-(void)resetMaskedWord {
    _maskedWord = [NSMutableString string];
    for (int i = 0; i < SECRED_WORD.length; i++) {
        [_maskedWord appendString:@"_"];
    }
    _labelResult.text = _maskedWord;
}
-(void)resetAll {
    _currentLifes = MAX_LIFES;
    [self resetMaskedWord];
    [self drawLifes];
    _labelStatus.text = @"";
}

-(BOOL)ganhou {
    return [SECRED_WORD isEqual:_maskedWord];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self resetAll];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_textFieldChute becomeFirstResponder];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    textField.text = [string uppercaseString];
    
    return NO;
}

@end
