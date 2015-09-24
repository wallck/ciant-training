//
//  ViewController.m
//  videos
//
//  Created by Wallace Goncalves de Oliveira on 14/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"
@import MediaPlayer;

@interface ViewController () {
    
}

@property (weak, nonatomic) IBOutlet UIView *playerView;
@property (nonatomic) MPMoviePlayerController *player;

@property (strong, nonatomic) IBOutletCollection(UIBarButtonItem) NSArray *barButtons;
@property (nonatomic) IBOutlet UIToolbar *toolBar;

@end

// NOTA: Formatos Suportados
// M4V, MOV, MP4, 3GP, h264

@implementation ViewController

- (IBAction)voltar:(UIBarButtonItem *)sender {
    // NOTA: Cuidado com o tempo, 1 segundo era pouco.
    _player.currentPlaybackTime = MAX(0, _player.currentPlaybackTime - 3);
}

- (IBAction)tocar:(UIBarButtonItem *)sender {
    NSMutableArray *botoes = [_barButtons mutableCopy];
    UIBarButtonSystemItem buttonType;
    
    if (_player.playbackState != MPMoviePlaybackStatePlaying) {
        [_player play];
        buttonType = UIBarButtonSystemItemPause;
    } else {
        [_player pause];
        buttonType = UIBarButtonSystemItemPlay;
    }
    
    UIBarButtonItem *playPause = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:buttonType
                                  target:self
                                  action:@selector(tocar:)];
    [botoes insertObject:playPause atIndex:(botoes.count / 2)];
    _toolBar.items = botoes;
}

- (IBAction)avancar:(UIBarButtonItem *)sender {
    _player.currentPlaybackTime = MIN(_player.playableDuration, _player.currentPlaybackTime + 3);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSURL *URL = [NSBundle.mainBundle URLForResource:@"microondas" withExtension:@"mp4"];
    
    _player = [[MPMoviePlayerController alloc] initWithContentURL: URL];
    
    // esticar o video
    _player.scalingMode = MPMovieScalingModeAspectFit;
    // controles do video (como criamos os controles podemos desabilitar aqui)
    _player.controlStyle = MPMovieControlStyleNone;
    // tamango do video
    _player.view.frame = _playerView.bounds;
    // adiciona o video na tela
    [_playerView addSubview:_player.view];
}

@end
