//
//  ViewController.m
//  audio
//
//  Created by Wallace Goncalves de Oliveira on 14/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"

//#import <AVFoundation/AVFoundation.h> necessário importar o framework no projeto
// ou
@import AVFoundation; // nao é necessário adicionar o framework no projeto

#define SOM_TRILHA @"trilha"
#define SOM_GAIVOTAS @"gaivota"
#define SOM_TECLADO @"teclado"
#define SOM_TELEPORT @"teleport"
#define SOM_ZUUUM @"zuuum"
#define EXTENSAO @"mp3"

#define WIDTH_PROGRESS_BAR 335

@interface ViewController () {
    AVAudioPlayer *_currentPlayer;
    NSTimer *_timer;
    BOOL _currentPlayerIsPaused;
}

@property (weak, nonatomic) IBOutlet UIButton *trilhaButton;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray<UIButton *> *efeitoButtons;
@property (weak, nonatomic) IBOutlet UIView *progressView;

// AudioPlayer
@property (nonatomic) AVAudioPlayer *trilhaPlayer;
@property (nonatomic) NSMutableArray<AVAudioPlayer *> *efeitoPlayers;

@end

@implementation ViewController

- (IBAction)tocarTrilhar:(UIButton *)sender {
    [self playAudioPlayer:_trilhaPlayer];
}

- (IBAction)tocarEfeito:(UIButton *)sender {
    AVAudioPlayer *player = _efeitoPlayers[sender.tag];
    [self playAudioPlayer:player];
}

- (void)playAudioPlayer:(AVAudioPlayer*)player {
    _currentPlayer = player;
    
    if (player.isPlaying) {
        [_timer invalidate];
        [_currentPlayer pause];
        _currentPlayerIsPaused = YES;
    } else {
        _currentPlayerIsPaused = NO;
        [_currentPlayer play];
        
        _timer = [NSTimer
                  scheduledTimerWithTimeInterval:0.001
                  target:self
                  selector:@selector(updateProgressBar:)
                  userInfo:nil
                  repeats:YES];
    }
}

- (void)updateProgressBar:(NSTimer *)timer {
    
    CGFloat width = WIDTH_PROGRESS_BAR;
    
    if (_currentPlayer.isPlaying) {
        NSTimeInterval current = _currentPlayer.currentTime;
        NSTimeInterval duration = _currentPlayer.duration;
        NSTimeInterval percentDuration = current / duration;
    
        width = percentDuration * WIDTH_PROGRESS_BAR;
    }
    
    if (!_currentPlayerIsPaused) {
        _progressView.frame = CGRectMake(_progressView.frame.origin.x,
                                         _progressView.frame.origin.y,
                                         width,
                                         _progressView.frame.size.height);
    }
    
    if (!_currentPlayer.isPlaying)
        return;
}

#pragma mark - animações

// TODO: fazer uma barra de progresso que exibe o estado atual do som
//
// recomendo UIView, -setFrame:
//
// disparando timer para atualizar progresso (NSTimer)
// +scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:

#pragma mark - AudioPlayers

- (void) carregaTrilha {
    _trilhaPlayer = [self audioPlayerForSoundName:SOM_TRILHA];
    [_trilhaPlayer prepareToPlay];
}

- (void) carregaEfeitos {
    _efeitoPlayers = [NSMutableArray array];
    
    NSArray *resources = @[ SOM_GAIVOTAS, SOM_TECLADO, SOM_TELEPORT, SOM_ZUUUM ];
    
    for (NSString *r in resources) {
        AVAudioPlayer *player = [self audioPlayerForSoundName:r];
        [player prepareToPlay];
        [_efeitoPlayers addObject: player];
    }
}

-(AVAudioPlayer*) audioPlayerForSoundName:(NSString*)url {
    NSURL *URL = [NSBundle.mainBundle URLForResource:url withExtension:EXTENSAO];
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:URL error:nil];
    return player;
}

#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    [self carregaTrilha];
    [self carregaEfeitos];
}

@end
