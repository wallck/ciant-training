//
//  ViewController.m
//  reloadTabela
//
//  Created by Wallace Goncalves de Oliveira on 31/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"
#import "ProdutoTableViewController.h"

#define CELL_ID @"CellId"

@interface ViewController () {
    
}

@property (nonatomic) NSArray *dados;

@end

@implementation ViewController

- (IBAction)refresh:(UIRefreshControl *)sender {

    // Aqui pode baixar json da web por exemplo...
    // Ou qualquer outra chamada com carregamento lento
    
    // request *Adiantando matéria
    NSURL *url = [NSURL
                  URLWithString:@"http://compracerta.vtexcommercestable.com.br/api/catalog_system/pub/products/search/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection
     sendAsynchronousRequest:request
     queue:[NSOperationQueue mainQueue]
     completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
         
         if (error)
             NSLog(@"Erro na conexão: %@", error);
         
         // parse JSON
         NSArray *dados = [NSJSONSerialization
                           JSONObjectWithData:data
                           options:0
                           error:nil];
         
        NSLog(@"%@", dados);
         
         // Salva os dados para popular a tabela
         self.dados = dados;
         
         // Precisamos terminar o refresh
         [sender endRefreshing];
     }];
}

- (void)setDados:(NSArray *)dados {
    _dados = dados;
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Chamando o refresh assim que entra na tela
    [self.refreshControl beginRefreshing];
    [self refresh:self.refreshControl];
}

#pragma mark - TableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dados.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];
    
    NSString *nome = [[self.dados objectAtIndex:indexPath.item] objectForKey: @"productName"];
    cell.textLabel.text = nome;
    
    return cell;
}

#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ProdutoTableViewController *view = (ProdutoTableViewController *)segue.destinationViewController;

    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    NSDictionary *produto = [self.dados objectAtIndex:indexPath.item];
    
    NSString *nome = [produto objectForKey:@"productName"];
    NSArray *items = [produto objectForKey:@"items"];
    
    view.title = nome;
    view.produtos = items;
}

@end
