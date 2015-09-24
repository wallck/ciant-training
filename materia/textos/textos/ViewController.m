//
//  ViewController.m
//  textos
//
//  Created by Wallace Goncalves de Oliveira on 24/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate> {
    NSMutableString *_chatText;
}

@property (weak, nonatomic) IBOutlet UITextView *textViewChat;
@property (weak, nonatomic) IBOutlet UITextField *textFieldMessage;

@end

@implementation ViewController

- (IBAction)enviar:(UIButton *)sender {
    
    NSLog(@"%@", _textViewChat.text);
    NSLog(@"%@", _textFieldMessage.text);
    
    if (_textFieldMessage.text.length > 0) {
        [_chatText appendFormat:@"%@\n", _textFieldMessage.text];
        
        _textViewChat.text = _chatText;
    }
    
    _textFieldMessage.text = @"";
}

// implementado do Delegate UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([[_textFieldMessage.text uppercaseString] isEqual: @"FDP"])
        return NO;
    
    [self enviar:nil];
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _chatText = [NSMutableString string];
    
    // também é possível pelo Storyboard
    //_textFieldMessage.delegate = self;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear: animated];

    // sempre abrir o teclado quando entrar na tela
    [_textFieldMessage becomeFirstResponder];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear: animated];
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear: animated];
}

@end
