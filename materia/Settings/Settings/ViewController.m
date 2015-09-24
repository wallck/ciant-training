//
//  ViewController.m
//  Settings
//
//  Created by Marcos Trovilho on 9/14/15.
//  Copyright © 2015 Marcos Trovilho. All rights reserved.
//

#import "ViewController.h"

#define NAME_PREF   @"name_preference"
#define SWITCH_PREF @"enabled_preference"
#define SLIDER_PREF @"slider_preference"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UISwitch    *toggleSwitch;
@property (weak, nonatomic) IBOutlet UISlider    *slider;

@end

@implementation ViewController

- (IBAction)readPrefs:(UIButton *)sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *name    = [userDefaults objectForKey:NAME_PREF];
    NSNumber *enabled = [userDefaults objectForKey:SWITCH_PREF];
    NSNumber *slider  = [userDefaults objectForKey:SLIDER_PREF];
    NSLog(@"%@ - %@ - %@", name, enabled, slider);
    
    _nameTextField.text = name;
    [_toggleSwitch setOn: enabled.boolValue animated:YES];
    [_slider setValue:slider.floatValue animated:YES];
}

- (IBAction)writePrefs:(UIButton *)sender {
    NSString *nome = _nameTextField.text;
    NSNumber *enabled = @(_toggleSwitch.on);
    NSNumber *slider = @(_slider.value);
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:nome    forKey:NAME_PREF];
    [userDefaults setObject:enabled forKey:SWITCH_PREF];
    [userDefaults setObject:slider  forKey:SLIDER_PREF];
    
    // NOTA: esses dados serão salvos quando o iOS decidir
    //       porém podemos forçar isso usando o método abaixo
    BOOL status = [userDefaults synchronize];
    NSLog(@"Status User Defaults: %@", @(status));
}

@end





