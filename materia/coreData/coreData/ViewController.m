//
//  ViewController.m
//  coreData
//
//  Created by Wallace Goncalves de Oliveira on 11/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>
#import "Pessoa.h"
#import "AppDelegate.h"

@interface ViewController ()

// Estas propriedades sao 'weak' pois ja estao sendo retidas por outras classes
@property (weak, nonatomic) NSManagedObjectContext *context;
@property (weak, nonatomic) AppDelegate *appDelegate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initContextFromAppDelegate];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self inserindoObjetos];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self buscandoObjetos];
        });
    });
}

// salva-se o appDelegate para user o -saveContext que já
// implementa tratamento de erros
- (void)initContextFromAppDelegate {
    _appDelegate = UIApplication.sharedApplication.delegate;
    _context = _appDelegate.managedObjectContext;
}

- (void)exemploAcessoPropriedades {
    // manipulando objetos SEM SUBCLASSE
    NSManagedObject *pessoa; // fetch
    // leitura
    NSString *nome = [pessoa valueForKey:@"nome"];
    // escrita
    [pessoa setValue:@"Joao" forKey:@"nome"];
    
    // COM SUBCLASSE
    Pessoa *p;
    nome = p.nome;
    p.nome = @"Joao";
}

- (void)inserindoObjetos {
    // 1 - busca de entidade
    NSEntityDescription *entidade = [NSEntityDescription
                                     entityForName:[Pessoa entityName]
                                     inManagedObjectContext:_context];
    // 2 - criacao
    Pessoa *p = [[Pessoa alloc]
                 initWithEntity:entidade
                 insertIntoManagedObjectContext:_context];
    
    // 3 - atribuicoes
    p.nome = @"Wallace";
    p.idade = @28;
    p.corPreferida = [UIColor blueColor];
    
    // 4 - salvar
    // ou salvamos o contexto (e tratamos o erro)
    // NSError *error = nil;
    // if(![_context save:&error])
    //      NSLog(@"%@", error);
    // ou chamamos o -saveContext do appDelegate
    [_appDelegate saveContext];
}

- (void)buscandoObjetos {
    // 1 - criar fetch request
    NSFetchRequest *request = [[NSFetchRequest alloc]
                               initWithEntityName:[Pessoa entityName]];
    
    // 2 - criando predicate
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", @"nome", @"Wallace"];
    [request setPredicate:predicate];
    
    // 3 - ordenacao
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"nome" ascending:YES];
    [request setSortDescriptors:@[sort]];
    
    // 4 - paginacao
    [request setFetchOffset:0];
    [request setFetchLimit:20];
    
    // 4 - executar request
    NSError *error = nil;
    NSArray *results = [_context executeFetchRequest:request
                                               error:&error];
    
    // se results for NIL, deu erro
    // se results for vazio, nao encontrou nenhum registro
    
    // 5 - ler resultado
    if (error) NSLog(@"%@", error);
    
    for (Pessoa *p in results) {
        NSLog(@"%@", p.nome);
    }
}

@end