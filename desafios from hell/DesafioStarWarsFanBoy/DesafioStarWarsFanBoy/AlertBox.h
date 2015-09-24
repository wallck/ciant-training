//
//  Alert.h
//  desafioGeral
//
//  Created by Wallace Goncalves de Oliveira on 02/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AlertBox : NSObject

@property UIViewController *viewController;
@property (readonly) UITextField *currentTextField;

+(instancetype)newWithViewController:(UIViewController*)viewController;

-(void)showWithTitle:(NSString*)title andMessage:(NSString*)message;
-(void)showWithTitle:(NSString*)title andMessage:(NSString*)message callback:(void (^)(UIAlertAction *action))handler;
-(void)showWithTitle:(NSString*)title andMessage:(NSString*)message callbackYES:(void (^)(UIAlertAction *action))handlerYES callbackNO:(void (^)(UIAlertAction *action))handlerNO;

-(void)showTextField:(UITextField*)textField WithTitle:(NSString*)title andMessage:(NSString*)message callback:(void (^)(UIAlertAction *action))handler;

@end