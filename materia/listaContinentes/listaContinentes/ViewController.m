//
//  ViewController.m
//  listaContinentes
//
//  Created by Wallace Goncalves de Oliveira on 28/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"

#define CELL_ID @"CellID"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate> {

    NSMutableArray *_continentes;
    
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _continentes = [NSMutableArray array];
    [_continentes addObject:@"Améria do Sul"];
    [_continentes addObject:@"América do Norte"];
    [_continentes addObject:@"Antártica"];
    [_continentes addObject:@"Europa"];
    [_continentes addObject:@"África"];
    [_continentes addObject:@"Ásia"];
    [_continentes addObject:@"Oceania"];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _continentes.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:CELL_ID];
    cell.textLabel.text = _continentes[indexPath.item];
    return cell;
}

@end
