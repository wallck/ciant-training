//
//  ViewController.m
//  magicalMogen
//
//  Created by Wallace Goncalves de Oliveira on 11/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"
#import "Pessoa.h"
#import <MagicalRecord/MagicalRecord.h>

@interface ViewController ()
@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // criando
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        Pessoa *p = [Pessoa MR_createEntityInContext:localContext];
        p.nome = @"Wallace";
    }];
    
    // encontrando
    NSArray *findAll = [Pessoa MR_findAll];
    // ou
    NSArray *find = [Pessoa MR_findByAttribute:PessoaAttributes.nome withValue:@"Wallace"];
    // ou
    Pessoa *p = [Pessoa MR_findFirstOrCreateByAttribute:PessoaAttributes.nome withValue:@"Wallace"];
    
    // criando com callbacks
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        Pessoa *p = [Pessoa MR_createEntityInContext:localContext];
        p.nome = @"Priscilla";
    } completion:^(BOOL contextDidSave, NSError *error) {
        NSArray *findAll = [Pessoa MR_findAll];
        NSLog(@"%@", findAll);
    }];
}

@end
