//
//  ViewController.m
//  emails
//
//  Created by Wallace Goncalves de Oliveira on 09/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"
#import <MessageUI/MessageUI.h>

@interface ViewController () <MFMailComposeViewControllerDelegate> {
    
}

@end

@implementation ViewController

-(void) mandarEmail {
    if (![MFMailComposeViewController canSendMail]) return;
    
    MFMailComposeViewController *email;
    email = [[MFMailComposeViewController alloc] init];
    
    // delegate
    email.mailComposeDelegate = self;
    
    // assunto
    [email setSubject:@"Teste CI&T"];
    
    // destinatarios
    [email setToRecipients:@[ @"wallace@bitzero.com.br" ]];
    
    // copia e copia oculta
    [email setCcRecipients:@[ @"wgoncalves@ciandt.com" ]];
    [email setBccRecipients:@[ @"wallace.oliveira@outlook.com" ]];
    
    // mensagem
    [email setMessageBody:@"Email de Teste" isHTML:YES];
    
    // anexo
    /*
    [email addAttachmentData:<#(NSData *)#>
                    mimeType:<#(NSString *)#>
                    fileName:<#(NSString *)#>];
    */
    
    [self presentViewController:email animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self mandarEmail];
}

#pragma mark - MFMailComposeViewControllerDelegate

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    NSLog(@"%d - %@", result, error);
    
    // p[recisamos descartas o MailViewController
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end