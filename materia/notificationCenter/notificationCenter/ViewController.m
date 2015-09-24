//
//  ViewController.m
//  notificationCenter
//
//  Created by Wallace Goncalves de Oliveira on 08/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"
#import "Notificador.h"

@interface ViewController () {
    NSMutableArray *_notificadores;
}

@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (IBAction)criarObjeto:(UIButton *)sender {
    Notificador *n = [Notificador new];
    
    if(_notificadores.count == 0) {
        [NSNotificationCenter.defaultCenter
         addObserver:self
         selector:@selector(notificacaoExclusiva:)
         name:NotificadorNome
         object:n];
    }
    
    [_notificadores addObject:n];
}

- (IBAction)Disparar1:(UIButton *)sender {
    Notificador *note = (Notificador*)[_notificadores lastObject];
    [note notificar];
}

- (IBAction)dispararTodos:(UIButton *)sender {
    [_notificadores makeObjectsPerformSelector:@selector(notificar)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _notificadores = [NSMutableArray array];
    
    // Escutar notificações do notificador
    [NSNotificationCenter.defaultCenter
     addObserverForName:NotificadorNome
     object:nil queue:NSOperationQueue.mainQueue usingBlock:^(NSNotification *note) {
         NSLog(@"%@", note);
     }];
}

-(void)notificacaoExclusiva:(NSNotification*)notification {
    NSLog(@"%@ %@", NSStringFromSelector(@selector(_cmd)), notification);
}

@end
