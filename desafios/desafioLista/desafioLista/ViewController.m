//
//  ViewController.m
//  desafioLista
//
//  Created by Wallace Goncalves de Oliveira on 28/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

/*
 
Desafio Lista

ViewController com TableView

Tela 1:
botão adicionar
exibir alerta com campo de texto
tabela para mostrar itens cadastrados
deslizar para esquerda com botao de apagar e editar
- editar: abre alerta para renomear
- apagar: apagar

*/

#import "ViewController.h"

#define CELL_ID @"CellId"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate> {
    NSMutableArray *_nomes;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)addTouched:(id)sender;

@end

@implementation ViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    _nomes = [NSMutableArray array];
}

- (IBAction)addTouched:(id)sender {
    
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"Adicionar Itens"
                                message:@"Digite o nome a ser adicionado"
                                preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        // Configura o TextField
        textField.placeholder = @"Digite o Nome";
    }];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleCancel
                               handler:^(UIAlertAction *action) {
                                   UITextField *textFieldNome = [[alert textFields] firstObject];
                                   [_nomes addObject:textFieldNome.text];
                                   [_tableView reloadData];
                               }];
    
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _nomes.count;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:CELL_ID];
    cell.textLabel.text = _nomes[indexPath.item];
    return cell;
}

-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewRowAction *editarAction = [UITableViewRowAction
                                          rowActionWithStyle:UITableViewRowActionStyleDefault
                                          title:@"Editar"
                                          handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
                                              UIAlertController *alert = [UIAlertController
                                                                          alertControllerWithTitle:@"Alterar Itens"
                                                                          message:@"Digite o nome a ser alterado"
                                                                          preferredStyle:UIAlertControllerStyleAlert];
                                              
                                              [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
                                                  // Configura o TextField
                                                  textField.text = _nomes[indexPath.item];
                                              }];
                                              
                                              UIAlertAction *okAction = [UIAlertAction
                                                                         actionWithTitle:@"OK"
                                                                         style:UIAlertActionStyleCancel
                                                                         handler:^(UIAlertAction *action) {
                                                                             UITextField *textFieldNome = [[alert textFields] firstObject];
                                                                             _nomes[indexPath.item] = textFieldNome.text;
                                                                             [_tableView reloadData];
                                                                         }];
                                              
                                              [alert addAction:okAction];
                                              
                                              [self presentViewController:alert animated:YES completion:nil];
                                          }];

    UITableViewRowAction *deletarAction = [UITableViewRowAction
                                          rowActionWithStyle:UITableViewRowActionStyleDestructive
                                          title:@"Excluir"
                                          handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
                                              [_nomes removeObjectAtIndex:indexPath.item];
                                              [_tableView reloadData];
                                          }];
    
    editarAction.backgroundColor = [UIColor lightGrayColor];
    
    deletarAction.backgroundColor = [UIColor redColor];
    
    // É possível também pegar a cor de uma imagem
    // deletarAction.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@""]];
    
    return @[ editarAction, deletarAction ];
}

@end