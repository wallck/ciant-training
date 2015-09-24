//
//  ViewController.m
//  operation
//
//  Created by Wallace Goncalves de Oliveira on 15/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"
#import "Operacao.h"

#define DATASOURCE_URL @"http://www.raywenderlich.com/downloads/ClassicPhotosDictionary.plist"

@interface ViewController () <OperacaoDelegate> {
    
}

@property (nonatomic) NSDictionary *dataSource;
@property (nonatomic) NSOperationQueue *queue;

@end

@implementation ViewController

- (void)addOperacao:(NSString*)url {
    NSURL *URL = [NSURL URLWithString:url];
    if (!URL) return;
    
    Operacao *op = [[Operacao alloc] initWithURL:URL delegate:self];
    
    // dependencia
    //[op addDependency:<#(nonnull NSOperation *)#>];
    
    // prioridade
    [op setQueuePriority:NSOperationQueuePriorityVeryLow];
    
    // completion block
    [op setCompletionBlock:^{
        NSLog(@"op %@ terminou", url);
    }];
    
    [_queue addOperation:op];
}

- (IBAction)criarOperacao:(UIButton *)sender {
    
    for (NSString *key in _dataSource.allKeys) {
        NSString *url = [_dataSource valueForKey:key];
        [self addOperacao:url];
    }
    
    // listando operacoes futuras
    NSLog(@"[%lu] %@", _queue.operationCount, _queue.operations);
}

- (IBAction)pausarOperacao:(UIButton *)sender {
    _queue.suspended = YES;
}

- (IBAction)retormarOperacao:(UIButton *)sender {
    _queue.suspended = NO;
}

- (IBAction)cancelarOperacoes:(UIButton *)sender {
    [_queue cancelAllOperations];
    [self initQueue];
}

#pragma mark - OperacaoDelegate

-(void)operacaoTerminouDeBaixarImagem:(UIImage *)imagem {
    NSLog(@"baixou imagem: %@", imagem);
}

#pragma mark -

- (void)initQueue {
    _queue = [NSOperationQueue new];
    _queue.name = @"Queue Download";
    
    // restringindo concorrencia
    _queue.maxConcurrentOperationCount = 3;
}

- (void)initDataSource {
    NSURL *dataSourceURL = [NSURL URLWithString:DATASOURCE_URL];
    _dataSource = [NSDictionary dictionaryWithContentsOfURL: dataSourceURL];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initQueue];
    [self initDataSource];
}

@end
