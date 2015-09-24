//
//  ViewController.m
//  social
//
//  Created by Wallace Goncalves de Oliveira on 09/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
    
}

@property (weak, nonatomic) IBOutlet UITextField *legendaTextField;
@property (weak, nonatomic) IBOutlet UIButton *botaoTwitter;
@property (weak, nonatomic) IBOutlet UIButton *botaoFacebook;
@property (weak, nonatomic) IBOutlet UIImageView *fotoImageView;

@end

@implementation ViewController

- (UIAlertController *)alertSheetController
{
    return [UIAlertController alertControllerWithTitle:@"Escolha a origem"
                                               message:nil
                                        preferredStyle:UIAlertControllerStyleActionSheet];
}

- (UIImagePickerController *)imagePickerWithSourceType:(UIImagePickerControllerSourceType)sourceType
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = sourceType;
    picker.delegate = self;
    picker.allowsEditing = YES;
    return picker;
}

- (UIAlertAction *)alertActionForSourceType:(UIImagePickerControllerSourceType)sourceType
{
    void (^handler)(UIAlertAction *) = ^(UIAlertAction *action) {
        UIImagePickerController *picker = [self imagePickerWithSourceType:sourceType];
        [self presentViewController:picker animated:YES completion:nil];
    };
    
    NSString *sheetTitle = @"Photo Library";
    
    return [UIAlertAction actionWithTitle:sheetTitle
                                    style:UIAlertActionStyleDefault
                                  handler:handler];
}

- (IBAction)carregarImagem:(UIButton *)sender {
    UIAlertController *alert = [self alertSheetController];
    
    UIAlertAction *action = [self alertActionForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [alert addAction:action];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel"
                                              style:UIAlertActionStyleDefault
                                            handler:nil]];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)shareTwitter:(UIButton *)sender {
    [self shareForServiceType:SLServiceTypeTwitter];
}

- (IBAction)shareFacebook:(UIButton *)sender {
    [self shareForServiceType:SLServiceTypeFacebook];
}

-(void)shareForServiceType:(NSString*)SLServiceType {
    SLComposeViewController *share = [SLComposeViewController composeViewControllerForServiceType:SLServiceType];
    
    // recebendo a resposta do share
    share.completionHandler = ^(SLComposeViewControllerResult result) {
        // TODO: Qualquer coisa
    };
    
    // texto
    [share setInitialText:_legendaTextField.text];
    
    // imagem
    [share addImage:_fotoImageView.image];
    
    // url
    [share addURL:nil];
    
    [self presentViewController:share
                       animated:YES
                     completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    NSLog(@"%@", [info allKeys]);
    
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    [_fotoImageView setImage:image];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
