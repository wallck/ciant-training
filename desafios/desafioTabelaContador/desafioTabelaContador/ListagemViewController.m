//
//  ListagemViewController.m
//  desafioTabelaContador
//
//  Created by Wallace Goncalves de Oliveira on 28/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ListagemViewController.h"
#import "Contador.h"
#import "TabBarController.h"

#define CELL_ID @"CellId"

@interface ListagemViewController () <UITableViewDataSource, UITableViewDelegate> {
    Contador *_contador;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ListagemViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    TabBarController *tab = (TabBarController*)self.tabBarController;
    _contador = tab.contador;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [_tableView reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _contador.numeros.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:CELL_ID];
    NSNumber *numero = _contador.numeros[indexPath.item];
    cell.textLabel.text = [NSString stringWithFormat:@"%03d", numero.intValue];
    
    return cell;
}

@end
