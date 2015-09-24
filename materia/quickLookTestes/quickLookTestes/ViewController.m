//
//  ViewController.m
//  quickLookTestes
//
//  Created by Wallace Goncalves de Oliveira on 08/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"
#import <QuickLook/QuickLook.h>

@interface ViewController () <QLPreviewControllerDataSource, QLPreviewControllerDelegate> {
    NSArray *_itens;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _itens = @[
               [[NSBundle mainBundle] URLForResource:@"pdf-sample" withExtension:@"pdf"],
               [[NSBundle mainBundle] URLForResource:@"pdf-sample2" withExtension:@"pdf"]
    ];
}

-(IBAction)abrirQuickLook {
    
    if ([QLPreviewController canPreviewItem:_itens[0]]) {
        NSLog(@"Posso fazer preview");
    }
    
    QLPreviewController *controller = [[QLPreviewController alloc] init];
    controller.dataSource = self;
    [self presentViewController:controller animated:YES completion:nil];
}

-(NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller {
    return _itens.count;
}

-(id<QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index {
    return _itens[index];
}

@end