//
//  ViewController.m
//  cameraAndFotos
//
//  Created by Wallace Goncalves de Oliveira on 03/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
    
}

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

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

- (NSString *)titleForSheetWithSourceType:(UIImagePickerControllerSourceType)sourceType
{
    switch (sourceType) {
        case UIImagePickerControllerSourceTypeCamera:
            return @"Camera";
            
        case UIImagePickerControllerSourceTypePhotoLibrary:
            return @"Photo Library";
            
        case UIImagePickerControllerSourceTypeSavedPhotosAlbum:
            return @"Saved Photos Album";
    }
    
    return nil;
}

- (UIAlertAction *)alertActionForSourceType:(UIImagePickerControllerSourceType)sourceType
{
    void (^handler)(UIAlertAction *) = ^(UIAlertAction *action) {
        UIImagePickerController *picker = [self imagePickerWithSourceType:sourceType];
        [self presentViewController:picker animated:YES completion:nil];
    };
    
    NSString *sheetTitle = [self titleForSheetWithSourceType:sourceType];
    
    return [UIAlertAction actionWithTitle:sheetTitle
                                    style:UIAlertActionStyleDefault
                                  handler:handler];
}

- (IBAction)escolherImagem:(id)sender
{
    UIAlertController *alert = [self alertSheetController];
    
    UIImagePickerControllerSourceType sourceTypes[] = {
        UIImagePickerControllerSourceTypeCamera,
        UIImagePickerControllerSourceTypePhotoLibrary,
        UIImagePickerControllerSourceTypeSavedPhotosAlbum
    };
    
    for (int i = 0; i < 3; i++) {
        if ([UIImagePickerController isSourceTypeAvailable:sourceTypes[i]]) {
            UIAlertAction *action = [self alertActionForSourceType:sourceTypes[i]];
            [alert addAction:action];
        }
    }
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel"
                                              style:UIAlertActionStyleDefault
                                            handler:nil]];
    
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - View Lifecycle

-(void)viewDidLoad {
    [super viewDidLoad];
    
    // checando se temos camera disponivel
    BOOL temCamFront = [UIImagePickerController
                          isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
    
    BOOL temCamTras = [UIImagePickerController
                       isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
    
    NSLog(@"%@", temCamFront ? @"Cam Front" : @"Sem Cam Front");
    NSLog(@"%@", temCamTras ? @"Cam Tras" : @"Sem Cam Tras");
    
    // checando se temos flash
    BOOL temFlashFront = [UIImagePickerController
                          isFlashAvailableForCameraDevice:UIImagePickerControllerCameraDeviceFront];
    
    BOOL temFlashTras = [UIImagePickerController
                         isFlashAvailableForCameraDevice:UIImagePickerControllerCameraDeviceRear];
    
    NSLog(@"%@", temFlashFront ? @"Cam Flash Cam Front" : @"Sem Flash Cam Front");
    NSLog(@"%@", temFlashTras ? @"Cam Flash Cam Tras" : @"Sem Flash Cam Tras");
    
    // checando os tipos de midia
    NSArray *camaraTypes = [UIImagePickerController
                            availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    
    NSArray *libTypes = [UIImagePickerController
                         availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    
    NSArray *albumTypes = [UIImagePickerController
                           availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    
    NSLog(@"%@", camaraTypes);
    NSLog(@"%@", libTypes);
    NSLog(@"%@", albumTypes);
}

#pragma mark - UIImagePickerControllerDelegate

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    NSLog(@"%@", [info allKeys]);
    
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    [_imageView setImage:image];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
