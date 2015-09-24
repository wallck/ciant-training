//
//  SecondViewController.m
//  desafioConversor
//
//  Created by Wallace Goncalves de Oliveira on 26/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "IdadeCaninaViewController.h"
#import "IdadeCaninaConversor.h"

@interface IdadeCaninaViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textFieldIdadeCao;
@property (weak, nonatomic) IBOutlet UITextField *textFieldIdadeHumana;

@end

@implementation IdadeCaninaViewController

- (IBAction)calcularTouched:(UIButton *)sender {
    int idade = [_textFieldIdadeCao.text doubleValue];
    
    IdadeCaninaConversor *mc = [IdadeCaninaConversor newComIdadeCanina:[NSNumber numberWithInt: idade]];
    
    NSNumber *idadeHumana = [mc paraIdadeHumana];
    
    _textFieldIdadeHumana.text = [NSString stringWithFormat:@"%d", idadeHumana.intValue];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

@end
