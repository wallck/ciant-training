//
//  ProdutoTableViewController.m
//  reloadTabela
//
//  Created by Wallace Goncalves de Oliveira on 31/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ProdutoTableViewController.h"
#import "ProdutoTableViewCell.h"

#define CELL_ID @"CellId"

@interface ProdutoTableViewController ()

@end

@implementation ProdutoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.produtos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProdutoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];
    
    NSDictionary    *item = self.produtos[indexPath.item];
    NSString        *sku = item[@"itemId"];
    NSString        *nome = item[@"nameComplete"];
    
    // Célula Customizada
    NSArray         *imagens = item[@"images"];
    NSDictionary    *fotoInfo = imagens[arc4random_uniform((int)imagens.count)];
    NSString        *fotoURL = fotoInfo[@"imageUrl"];
    
    NSURL *urlFoto = [NSURL URLWithString:fotoURL];
    NSData *dataFoto = [NSData dataWithContentsOfURL:urlFoto];
    UIImage *imageFoto = [UIImage imageWithData:dataFoto];
    
    cell.labelNome.text = nome;
    cell.labelSKU.text = sku;
    cell.imageFoto.image = imageFoto;
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
