//
//  ViewController.m
//  webView
//
//  Created by Wallace Goncalves de Oliveira on 26/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textFieldURL;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;
@end

@interface ViewController(WebViewDelegate) <UIWebViewDelegate>
@end

@interface ViewController(TextFieldDelegate) <UITextFieldDelegate>
@end




@implementation ViewController

-(void)viewDidAppear:(BOOL)animated {
    [self carregarPagina];
}

-(void)carregarPagina {
    NSURL *url = [NSURL URLWithString:_textFieldURL.text];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL: url];
    [_webView loadRequest: request];
}

@end

@implementation ViewController (WebViewDelegate)

-(void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    NSString *href = [_webView stringByEvaluatingJavaScriptFromString:@"window.location.href"];
    _textFieldURL.text = href;
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"%@ %@", NSStringFromSelector(_cmd), error);
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    return YES;
}

@end

@implementation ViewController (TextFieldDelegate)

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    // carregar página
    [self carregarPagina];
    
    // esconde o teclado
    return [textField resignFirstResponder];
}

@end
