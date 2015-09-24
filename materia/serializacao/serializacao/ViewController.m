//
//  ViewController.m
//  serializacao
//
//  Created by Wallace Goncalves de Oliveira on 04/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"
#import "Post.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Post *p = [Post new];
    p.titulo = @"Teste";
    p.conteudo = @"Lorem Ipsum Dolar Sit Amet";
    p.data = [NSDate new];
    
    // #ESCREVENDO
    
    // TODO: pegar o path do Document ou Cache
    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    path = [path stringByAppendingPathComponent:@"post.data"];
    
    // serializando o objeto
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:p];
    BOOL status = [data writeToFile:path atomically:YES];
    
    // OU
    
    // serializando o objeto e escrevendo no arquivo
    status = [NSKeyedArchiver archiveRootObject:p toFile:path];
    
    // #LENDO
    
    // TODO: pegar o path do Document ou Cache
    // NSString *path;
    
    // deserializando o objeto
    NSData *dataBin = [NSData dataWithContentsOfFile:path];
    Post *post = [NSKeyedUnarchiver unarchiveObjectWithData:dataBin];
    
    // OU
    
    // lendo no arquivo e deserializando o objeto
    post = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}

@end
