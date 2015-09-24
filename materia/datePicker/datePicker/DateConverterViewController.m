//
//  DateConverterViewController.m
//  datePicker
//
//  Created by Wallace Goncalves de Oliveira on 01/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

/*
 
 - Pegar data digitada no textField
   converter para NSDate usando NSDateFormatter
   depois converter para string novamente usando NSDateFormatter (style)
   exibir na label
 
 - Ao mudar o datePicker usar o dateFormatter para exibir na label
 
 */

#import "DateConverterViewController.h"

@interface DateConverterViewController () {
    NSDateFormatter *_dateFormatter;
}

@property (weak, nonatomic) IBOutlet UITextField *textFieldDate;
@property (weak, nonatomic) IBOutlet UILabel *labelFormatedDate;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation DateConverterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dateFormatter = [[NSDateFormatter alloc] init];
}

- (IBAction)convertTouched:(UIButton *)sender {
    [self formatDateWithString:_textFieldDate.text];
}

- (IBAction)datePickerChanged:(UIDatePicker *)sender {
    [self formatDateWithDate:sender.date];
}

-(void)formatDateWithString:(NSString*)date {
    [self startReading];
    NSDate *newDate = [_dateFormatter dateFromString:_textFieldDate.text];
    
    [self startWriting];
    _labelFormatedDate.text = [_dateFormatter stringFromDate:newDate];
    [_datePicker setDate:newDate animated:YES];
}

-(void)formatDateWithDate:(NSDate*)date {
    [self startWriting];
    _labelFormatedDate.text = [_dateFormatter stringFromDate:_datePicker.date];
}

-(void)startReading {
    _dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss Z";
}

-(void)startWriting {
    _dateFormatter.dateStyle = NSDateFormatterLongStyle;
    _dateFormatter.timeStyle = NSDateFormatterLongStyle;
    _dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"pt-BR"];
}

@end
