//
//  ImagensViewController.m
//  Imagens
//
//  Created by Marcos Trovilho on 25/08/15.
//  Copyright (c) 2015 Marcos Trovilho. All rights reserved.
//

#import "ImagensViewController.h"

@interface ImagensViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@end

@interface ImagensViewController (ScrollViewDelegate) <UIScrollViewDelegate>
@end

#define IMAGENS_ARRAY @[ @"cerveja1", @"cerveja2", @"cerveja3", @"cerveja4", @"cerveja5"]
#define IMAGEM_RECT CGRectMake(0, 0, 375, 400)

@implementation ImagensViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // criar os imageViews dinamicamente
    CGRect containerRect = IMAGEM_RECT;
    containerRect.size.width = IMAGEM_RECT.size.width * IMAGENS_ARRAY.count;
    UIView *container = [[UIView alloc] initWithFrame: containerRect];
    
    for (int i = 0; i < IMAGENS_ARRAY.count; i++) {
        NSString *nome = IMAGENS_ARRAY[i];
        
        CGRect imageViewRect = IMAGEM_RECT;
        imageViewRect.origin.x = i * IMAGEM_RECT.size.width;

        UIImage *imagem = [UIImage imageNamed:nome];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:imageViewRect];
        [imageView setContentMode:UIViewContentModeScaleAspectFill];
        [imageView setImage:imagem];
        
        [container addSubview:imageView];
    }
    
    // adicionar a view no scrollView
    [[self scrollView] addSubview:container];
    
    // setar o 'contentSize' do scrollView para o 'frame' da view
    [[self scrollView] setContentSize:container.frame.size];
    
    // parte 2: habilitar a paginação no scrollView
    [[self scrollView] setPagingEnabled:YES];
    
    // parte 3
    [self pageControl].numberOfPages = IMAGENS_ARRAY.count;
}

- (IBAction)pageControlChanged:(UIPageControl *)sender {
    // encontrar o contentOffset baseado na pagina atual
    
    float x = sender.currentPage * self.scrollView.frame.size.width;
    CGPoint point = CGPointMake(x, self.scrollView.contentOffset.y);
    
    // sender.currentPage
    // contrario de:
    // self.pageControl.currentPage = scrollView.contentOffset.x /scrollView.frame.width;
    
    // mover para a paina, animadamente
    [self.scrollView setContentOffset:point animated: YES];
}

@end

@implementation ImagensViewController (ScrollViewDelegate)

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger currentPage = (NSInteger)(scrollView.contentOffset.x / scrollView.frame.size.width);
    [self pageControl].currentPage = currentPage;
}

@end
