//
//  ViewController.m
//  GCD
//
//  Created by Wallace Goncalves de Oliveira on 10/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"

typedef void (^TipoBloco)(NSString *, NSError *);
typedef void (^TipoBlocoNomeado)(NSString *nome, NSError *error);

@interface ViewController ()

@property (nonatomic, copy) TipoBlocoNomeado handler;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // GCD (Grand Central Dispatch)
    // Sistema de "Threads" (pensar em queue)
    // - baseado em blocks (callbacks, lambdas, closures)
    // - threads sao automaticamente criadas e destruidas
    //   quando necessario e quando possivel
    // - nao necessariamente um bloco rodara em uma thread
    //   separada, mas serao concorrentes
    
    // buscando yna qyeye di sustena
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(queue, ^{
        NSLog(@"Rodando em background");
        
        // na hora de atualizar interface *devemos* fazer em main_queue
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"Rodando em main");
        });
    });
    
    // acessando variaveis dentro do block
    NSString *nome = @"João"; // acesso normal

    // para alterar precisamos marcar a variavel com __block
    __block NSInteger valor = 5;
    __block NSNumber *preco;
    
    dispatch_async(queue, ^{
        NSLog(@"%@", nome);
        valor += 9;
        preco = @(100);
    });
    
    // rodando um loop em background
    dispatch_apply(10, queue, ^(size_t i) {
        // NOTA: nao use logs aqui dentro
        //       NSLog, printf, puts, etc...
        // todos os logs vao fazer um lock para escrever, com isto
        // os blocos nao vao executar de maneira paralela
        //
        // *em swift pode user printf
    });
    
    // disparando bloco depois de um tempo
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"Passaram 3 segundos");
    });
    
    // declarando blocks
    // DICA: fuckingblocksyntax.com
    
    // tipoRetorno (^nomeBloco)(tipoParametros) = ^tipoRetorno(parametros) {
    // };
    
    void (^meuBloco)(NSString*, NSError*) = ^(NSString *s, NSError *e) {
        NSLog(@"%@ - %@", s, e);
    };
    
    // chamando o bloco
    meuBloco(@"teste", nil);
    
    // usando o typedef
    TipoBloco outroBloco = ^(NSString *s, NSError *e) {
        NSLog(@"%@ - %@", s, e);
    };
    
    outroBloco(@"Outro teste", nil);
    
    [self executar:^(NSString *nome, NSError *error) {
        NSLog(@"%@ - %@", nome, error);
    }];
    
    [self bloco]();
    
    // block em property
    _handler = outroBloco;
    _handler(@"property", nil);
    
    NSLog(@"fim do viewDidLoad");
}

// funcao com block

-(void)executar:(TipoBlocoNomeado)bloco {
    bloco(@"executando", nil);
}

-(void (^)(void))bloco {
    return ^{ NSLog(@"Opa"); };
}






@end