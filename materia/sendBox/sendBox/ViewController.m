//
//  ViewController.m
//  sendBox
//
//  Created by Wallace Goncalves de Oliveira on 03/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"

#define ARQUIVO @"data.json"
#define ARQUIVO_DESTINO @"destino.json"

typedef NS_ENUM(NSUInteger, StatusType) {
    StatusTypeIdle = 0,
    StatusTypeCarregando,
    StatusTypeCopiando,
    StatusTypeApagando
};

@interface ViewController () {
    StatusType _currentStatus;
}

@property (weak, nonatomic) IBOutlet UILabel *nomeArquivoLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusArquivoLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusCopiaLabel;
@property (weak, nonatomic) IBOutlet UIButton *carregarArquivoButton;
@property (weak, nonatomic) IBOutlet UIButton *copiarArquivoButton;
@property (weak, nonatomic) IBOutlet UIButton *apagarTUDOButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *destinoSegment;

@end

@implementation ViewController

#pragma mark - Actions

-(NSString *)bundlePath {
    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:ARQUIVO];
    return path;
}

-(NSString *)pathForDirectory:(NSSearchPathDirectory)directory withFileName:(NSString*)fileName {
    // encontrando pasta de documentos ou cache (enum directory passado acima)
    NSArray *diretorios = NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES);
    NSString *path = diretorios[0];
    
    // NOTA: É necessário concatenar o nome do arquivo antes de copiar (path completo)
    
    // destino
    NSString *pathDestino = [path stringByAppendingPathComponent:fileName];
    
    return pathDestino;
}

-(BOOL)fileExists:(NSString*)path {
    return [NSFileManager.defaultManager fileExistsAtPath:path];
}

- (IBAction)carregarArquivo:(UIButton *)sender {
    NSString *path = [self bundlePath];
    
    if ([self fileExists:path]) {
        [self setCarregarLabel:StatusTypeCarregando];
        [self setCopiarEnabled:StatusTypeCarregando];
    }
}

-(NSSearchPathDirectory)destinyDirectory {
    // no iPhone só interessa estes 2
    // DOCUMENTS -> NSDocumentDirectory
    // ou CACHE  -> NSCachesDirectory
    return _destinoSegment.selectedSegmentIndex == 0 ? NSDocumentDirectory : NSCachesDirectory;
}

- (IBAction)copiarArquivo:(UIButton *)sender {

    // origem
    NSString *pathOrigem = [self bundlePath];

    // destino
    NSSearchPathDirectory destino = [self destinyDirectory];
    NSString *pathDestino = [self pathForDirectory:destino withFileName:ARQUIVO_DESTINO];
    
    NSError *error = nil;
    [NSFileManager.defaultManager
     copyItemAtPath:pathOrigem
     toPath:pathDestino
     error:&error];
    
    if (error)
        NSLog(@"Erro ao Copiar: %@", error);
    else {
        [self setStatusCopiarLabel:StatusTypeCopiando];
        [self setDeletarEnabled:StatusTypeCopiando];
    }
}

- (IBAction)apagarTUDO:(UIButton *)sender {
    NSString *pathDestinoDocument = [self pathForDirectory:NSDocumentDirectory withFileName:ARQUIVO_DESTINO];
    NSString *pathDestinoCache = [self pathForDirectory:NSCachesDirectory withFileName:ARQUIVO_DESTINO];
    
    NSError *error = nil;
    [NSFileManager.defaultManager
     removeItemAtPath:pathDestinoDocument
     error:&error];

    if (error)
        NSLog(@"Erro ao Copiar: %@", error);
        
    [NSFileManager.defaultManager
     removeItemAtPath:pathDestinoCache
     error:&error];
    
    if (error)
        NSLog(@"Erro ao Copiar: %@", error);
    else {
        [self setStatusCopiarLabel:StatusTypeCopiando];
        [self setDeletarEnabled:StatusTypeCopiando];
    }
}

- (IBAction)mudouDestino:(UISegmentedControl *)sender {
}

#pragma mark - Helpers

/*
    TODO:   - define com o nome do arquivo
            - no viewDidAppear configurar interface (mostra nome na label)
                - botao carregar enabled e resto não
            - acao do botao carregar, chegar se o arquivo existe no bundle
              e atualizar interface
*/
-(void)setCarregarLabel:(StatusType)status {
    if (status == StatusTypeCarregando)
        _statusArquivoLabel.text = @"Status: Carregado";
    
    _currentStatus = status;
}
-(void)setStatusCopiarLabel:(StatusType)status {
    if (status == StatusTypeCopiando)
        _statusArquivoLabel.text = @"Status: Copiado";
    
    _currentStatus = status;
}
-(void)setCopiarEnabled:(StatusType)status {
    if (status == StatusTypeCarregando) {
        [_carregarArquivoButton setTitle:@"Descarregar Arquivo" forState:UIControlStateNormal];
        _destinoSegment.enabled = YES;
        _copiarArquivoButton.enabled = YES;
    }
    
    _currentStatus = status;
}
-(void)setDeletarEnabled:(StatusType)status {
    _apagarTUDOButton.enabled = status == StatusTypeCopiando;
    
    if (status == StatusTypeApagando) {
        _statusArquivoLabel.text = @"Status: Apagado";
        _destinoSegment.enabled = NO;
        _copiarArquivoButton.enabled = NO;
    }
    
    _currentStatus = status;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

@end
