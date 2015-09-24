//
//  ViewController.m
//  scrollView
//
//  Created by Wallace Goncalves de Oliveira on 25/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"

#define IMAGE_NAME @"cerveja1"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic) UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // adicionar imagem
    // nota: utilizar propriedade imageView
    UIImage *image = [UIImage imageNamed:IMAGE_NAME];
    self.imageView = [[UIImageView alloc] initWithImage:image];
    
    [self.scrollView addSubview:self.imageView];
    
    // setar contentSize
    [self.scrollView setContentSize:self.imageView.image.size];
    
    // parte 2:
    // habilitar zoom:
    //  - propriedade min/max zoom com valores diferentes
    [self.scrollView setMinimumZoomScale:1];
    [self.scrollView setMaximumZoomScale:2];
    //  - implementar metodos de delegate
}

// A documentação fala para implementar esse metodo.
// Mas está funcionando sem ele (iOS 8)
-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
    NSLog(@"Terminou Zoom em: %.1f", scale);
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

@end
