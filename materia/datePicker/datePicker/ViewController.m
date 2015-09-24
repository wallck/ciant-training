//
//  ViewController.m
//  datePicker
//
//  Created by Wallace Goncalves de Oliveira on 01/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSDateFormatter *_dateFormatter;
}

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dateFormatter = [[NSDateFormatter alloc] init];
    
    // formatando data para string
    //_dateFormatter.dateFormat = @"yyyy/MM/dd HH:mm";
    // ou (ele retira o dateFormat)
    _dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    _dateFormatter.timeStyle = NSDateFormatterShortStyle;
    
    // timezone
    //_dateFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"PDT"];
    // ou locale
    _dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"pt-BR"];
    
    //self.datePicker.minimumDate = [NSDate alloc] init
}

- (IBAction)dateChanged:(id)sender {
    
    // NSData está GMT por padrão
    //NSLog(@"%@", _datePicker.date);
    
    NSLog(@"%@", [_dateFormatter stringFromDate:_datePicker.date]);
}

@end
