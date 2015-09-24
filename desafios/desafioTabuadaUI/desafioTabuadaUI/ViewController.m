//
//  ViewController.m
//  desafioTabuadaUI
//
//  Created by Wallace Goncalves de Oliveira on 24/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    UILabel *valorLabels[10][10];
    NSMutableArray *labelsToClear;
}

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentTabuada;

@end

@implementation ViewController

- (IBAction)segmentTabuadaChanged:(UISegmentedControl *)sender {
    
    NSUInteger index = _segmentTabuada.selectedSegmentIndex;
    
    [labelsToClear makeObjectsPerformSelector:@selector(setBackgroundColor:) withObject:[UIColor clearColor]];
    [labelsToClear removeAllObjects];
    
    for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 10; j++) {
            if (i == index || j == index) {
                UILabel *label = valorLabels[i][j];
                [label setBackgroundColor:[UIColor yellowColor]];
                [labelsToClear addObject:label];
            }
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    labelsToClear = [NSMutableArray array];
    
    // Criar linhas
    for (int i = 1; i < 11; i++) {
        
        // 16 é a margem padrão do iphone
        CGRect r = CGRectMake(16, 70 + (30 * i), 30, 30);
        UILabel *label = [[UILabel alloc] initWithFrame:r];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setText:[NSString stringWithFormat:@"%d", i]];
        [label setBackgroundColor:[UIColor blackColor]];
        [label setTextColor:[UIColor whiteColor]];
        [[label layer] setBorderWidth:1];
        
        [[self view] addSubview:label];
    }
    
    // Criar colunas
    for (int i = 1; i < 11; i++) {
        
        // 16 é a margem padrão do iphone
        CGRect r = CGRectMake(16 + (30 * i), 70, 30, 30);
        UILabel *label = [[UILabel alloc] initWithFrame:r];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setText:[NSString stringWithFormat:@"%d", i]];
        [label setBackgroundColor:[UIColor blackColor]];
        [label setTextColor:[UIColor whiteColor]];
        [[label layer] setBorderWidth:1];
        
        [[self view] addSubview:label];
    }
    
    // Preencher Matriz
    for (int i = 1; i < 11; i++) {
        for (int j = 1; j < 11; j++) {
            CGRect r = CGRectMake(16 + (30 * j), 70 + (30 * i), 30, 30);
            UILabel *label = [[UILabel alloc] initWithFrame:r];
            [label setTextAlignment:NSTextAlignmentCenter];
            [label setText:[NSString stringWithFormat:@"%d", i * j]];
            [[label layer] setBorderWidth:1];
        
            [[self view] addSubview:label];
            valorLabels[i-1][j-1] = label;
        }
    }
}

@end
