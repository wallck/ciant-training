//
//  ContinentesTableViewController.m
//  DesafioPlanetaTerra
//
//  Created by Marcos Trovilho on 31/08/15.
//  Copyright (c) 2015 Marcos Trovilho. All rights reserved.
//

#import "ContinentesTableViewController.h"
#import "PlanetaTerra.h"
#import "PaisesTableViewController.h"

#define CONTINENTES_CELL_IDENTIFIER @"ContinentsCellId"

@interface ContinentesTableViewController () {
    
}

@property (nonatomic) NSArray *continentes;

@end



@implementation ContinentesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     Tabela com lista de continentes
     - nome
     - siglas
     - quantidade de paises
     */
    
    self.continentes = [PlanetaTerra listaContinentes];
}

#pragma mark - TableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self continentes] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CONTINENTES_CELL_IDENTIFIER
                                                            forIndexPath:indexPath];
    
    NSString *nomeContinente = [self.continentes objectAtIndex:indexPath.item];
    NSString *siglaContinente = [PlanetaTerra siglaContinente:nomeContinente];
    NSNumber *totalPaises    = @([PlanetaTerra totalPaisesContinente:siglaContinente]);
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", siglaContinente, nomeContinente];
    cell.detailTextLabel.text = totalPaises.stringValue;
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    PaisesTableViewController *paisesTVC = [segue destinationViewController];
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    NSString *nomeContinente = [self.continentes objectAtIndex:indexPath.item];
    NSString *siglaContinente = [PlanetaTerra siglaContinente:nomeContinente];

    paisesTVC.title = nomeContinente;
    paisesTVC.paises = [PlanetaTerra listaPaisesContinente:siglaContinente];
}

@end
