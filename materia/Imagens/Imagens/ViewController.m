//
//  ViewController.m
//  Imagens
//
//  Created by Marcos Trovilho on 25/08/15.
//  Copyright (c) 2015 Marcos Trovilho. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    UIImageView *_imageView;
}
@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // ImageView do Storyboard
    
    // podemos acessar as views pela `tag`
    UIImageView *imageView = (UIImageView *)[[self view] viewWithTag:10];
    NSLog(@"%@", imageView);
    
    // existe a propriedade `subviews` que retorna um
    // array de subviews
    for (UIView *v in [[self view] subviews]) {
        NSLog(@"%@", v);
    }
    
    // ImageView via código
    
    CGRect rect = CGRectMake(0, 400, 300, 300);
    _imageView = [[UIImageView alloc] initWithFrame:rect];
    // tambem podemos inicializar com imagem, assim o tamanho já
    // é inferido pelo tamanho da imagem
    // _imageView = [[UIImageView alloc] initWithImage:<#(UIImage *)#>]
    
    // contentMode: como vai ser desenhada (AspectFill/Fit, Scale)
    [_imageView setContentMode:UIViewContentModeScaleAspectFit];
    
    // UIImage
    UIImage *image = [UIImage imageNamed:@"queijo"];
    [_imageView setImage:image];
    
    // adicionar na tela
    [[self view] addSubview:_imageView];
}

@end




