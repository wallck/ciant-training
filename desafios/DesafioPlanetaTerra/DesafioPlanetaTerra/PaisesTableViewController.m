//
//  PaisesTableViewController.m
//  DesafioPlanetaTerra
//
//  Created by Marcos Trovilho on 31/08/15.
//  Copyright (c) 2015 Marcos Trovilho. All rights reserved.
//

#import "PaisesTableViewController.h"
#import "PlanetaTerra.h"

#define PAISES_CELL_IDENTIFIER @"PaisesCellId"

@interface PaisesTableViewController ()
@end

@implementation PaisesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
/*
 Tabela com lista de paises por continentes
 - nome
 - bandeira
 */
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.paises.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:PAISES_CELL_IDENTIFIER
                                                            forIndexPath:indexPath];
    
    NSString *nomePais = [[self.paises objectAtIndex:indexPath.item] objectForKey:@"name"];

    cell.textLabel.text = nomePais;
    cell.imageView.image = [PlanetaTerra bandeiraPais:nomePais tamanho:PlanetaTerraBandeiraTamanhoPequeno];
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
