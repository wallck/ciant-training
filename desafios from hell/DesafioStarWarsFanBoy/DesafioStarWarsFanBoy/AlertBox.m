//
//  Alert.m
//  desafioGeral
//
//  Created by Wallace Goncalves de Oliveira on 02/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "AlertBox.h"

@implementation AlertBox

+(instancetype)newWithViewController:(UIViewController *)viewController {
    return [[AlertBox alloc] initWithViewController:viewController];
}

-(instancetype)init {
    return [self initWithViewController:nil];
}

-(instancetype)initWithViewController:(UIViewController*)viewController {
    self = [super init];
    
    if (self) {
        _viewController = viewController;
    }
    
    return self;
}

-(void)showWithTitle:(NSString *)title andMessage:(NSString *)message {
    [self showWithTitle:title andMessage:message callback:nil];
}

-(void)showWithTitle:(NSString *)title andMessage:(NSString *)message callback:(void (^)(UIAlertAction *))handler {
    [self showTextField:nil WithTitle:title andMessage:message callback:handler];
}

-(void)showWithTitle:(NSString *)title andMessage:(NSString *)message callbackYES:(void (^)(UIAlertAction *))handlerYES callbackNO:(void (^)(UIAlertAction *))handlerNO {
    UIAlertController *alert = [self makeAlertWithTitle:title andMessage:message];
    
    UIAlertAction *yesAction = [self makeOKAction:handlerYES withTitle:@"YES"];
    [alert addAction:yesAction];
    
    UIAlertAction *noAction = [self makeCancelAction:handlerNO withTitle:@"NO"];
    [alert addAction:noAction];
    
    [_viewController presentViewController:alert animated:YES completion:nil];
}

-(void)showTextField:(UITextField *)textField WithTitle:(NSString *)title andMessage:(NSString *)message callback:(void (^)(UIAlertAction *))handler {
    UIAlertController *alert = [self makeAlertWithTitle:title andMessage:message];
    
    if (textField) {
        [alert addTextFieldWithConfigurationHandler:^(UITextField *tf) {
            tf.placeholder = textField.placeholder;
            tf.text = textField.text;
        }];
    }
    
    UIAlertAction *okAction = [self makeOKAction:handler];
    [alert addAction:okAction];
    
    _currentTextField = [alert.textFields firstObject];
    
    [_viewController presentViewController:alert animated:YES completion:nil];
}

-(UIAlertController*) makeAlertWithTitle:(NSString*)title andMessage:(NSString*)message {
    return [UIAlertController
            alertControllerWithTitle:title
            message:message
            preferredStyle:UIAlertControllerStyleAlert];
}

-(UIAlertAction*) makeOKAction:(void (^)(UIAlertAction *))handler {
    return [UIAlertAction
            actionWithTitle:@"OK"
            style:UIAlertActionStyleDefault
            handler:handler];
}

-(UIAlertAction*) makeOKAction:(void (^)(UIAlertAction *))handler withTitle:(NSString*)title {
    return [UIAlertAction
            actionWithTitle:title
            style:UIAlertActionStyleDefault
            handler:handler];
}

-(UIAlertAction*) makeCancelAction:(void (^)(UIAlertAction *))handler withTitle:(NSString*)title {
    return [UIAlertAction
            actionWithTitle:title
            style:UIAlertActionStyleCancel
            handler:handler];
}

@end