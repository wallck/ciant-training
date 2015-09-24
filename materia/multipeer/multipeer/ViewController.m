//
//  ViewController.m
//  multipeer
//
//  Created by Wallace Goncalves de Oliveira on 14/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"
@import MultipeerConnectivity;

#define SERVICE_TYPE @"service-chat"

@interface ViewController () {
    
}

@property MCBrowserViewController *browser;
@property MCAdvertiserAssistant *advertiser;
@property MCSession *session;
@property MCPeerID *peerID;

// TODO: interface
@property (weak, nonatomic) IBOutlet UITextView *chatTextView;
@property (weak, nonatomic) IBOutlet UITextField *messageTextField;

@end

@interface ViewController (MCSessionDelegate) <MCSessionDelegate>

@end

@interface ViewController (MCBrowserViewControllerDelegate) <MCBrowserViewControllerDelegate>

@end

@implementation ViewController

// TODO: interface
- (IBAction)sendMessage:(id)sender {
    // 1 - Mensagem -> NSData
    NSData *data = [_messageTextField.text dataUsingEncoding:NSUTF8StringEncoding];

    // 2 - Enviar data para session
    [_session sendData:data
               toPeers:_session.connectedPeers
              withMode:MCSessionSendDataReliable
                 error:nil];
    // 3 - Atualizar o chatView com sua mensagem
    _chatTextView.text = [NSString stringWithFormat:@"%@\nWallace: %@", _chatTextView.text, _messageTextField.text];
    _messageTextField.text = @"";
}

- (IBAction)findFriends:(id)sender {
    [self presentViewController: self.browser animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Peer ID
    NSString *nomeDoAparelho = @"Wallace"; // TODO: pegar dinamicamente (UIDevice)
    _peerID = [[MCPeerID alloc] initWithDisplayName:nomeDoAparelho];
    
    // Session
    _session = [[MCSession alloc] initWithPeer:_peerID];
    _session.delegate = self;
    
    // Browser
    _browser = [[MCBrowserViewController alloc] initWithServiceType:SERVICE_TYPE session:_session];
    _browser.delegate = self;
    
    // Advertiser
    _advertiser = [[MCAdvertiserAssistant alloc]
                   initWithServiceType:SERVICE_TYPE
                   discoveryInfo:nil
                   session:_session];
    [_advertiser start];
}

@end

@implementation ViewController(MCSessionDelegate)

-(void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID {
    NSString *message = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    _chatTextView.text = [NSString stringWithFormat:@"%@\n%@: %@", _chatTextView.text, peerID.displayName, _messageTextField.text];
}
-(void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state {
    
}
-(void)session:(MCSession *)session didReceiveStream:(NSInputStream *)stream withName:(NSString *)streamName fromPeer:(MCPeerID *)peerID {
    
}
-(void)session:(MCSession *)session didStartReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID withProgress:(NSProgress *)progress {
    
}
-(void)session:(MCSession *)session didFinishReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID atURL:(NSURL *)localURL withError:(NSError *)error {
    
}

@end

@implementation ViewController(MCBrowserViewControllerDelegate)

-(void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
