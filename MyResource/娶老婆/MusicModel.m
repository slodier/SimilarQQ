//
//  MusicModel.m
//  娶老婆
//
//  Created by 736376103@qq.com on 16/3/29.
//  Copyright © 2016年 736376103@qq.com. All rights reserved.
//

#import "MusicModel.h"
#import <AVFoundation/AVFoundation.h>

@interface MusicModel ()
@end

@implementation MusicModel
static AVAudioPlayer *player;

static NSMutableDictionary *_musicPlayers;

+ (NSMutableDictionary *)musicPlayers {
    if (_musicPlayers == nil) {
        _musicPlayers = [NSMutableDictionary dictionary];
    }
    return _musicPlayers;
}

+ (BOOL)PlayWithFilename:(NSString *)filename {
    
    if (!player){
        NSString *path = [[NSBundle mainBundle]pathForResource:filename ofType:nil];
        NSURL *url = [NSURL fileURLWithPath:path];
        player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
        [player prepareToPlay];
        [player play];
        player.numberOfLoops = 0;
        
    }else if ([player isPlaying]){
        NSString *path = [[NSBundle mainBundle]pathForResource:filename ofType:nil];
        NSURL *url = [NSURL fileURLWithPath:path];
        player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
        [player prepareToPlay];
        [player play];
        player.numberOfLoops = 0;
    }
    return player;
}

+ (void)pauseMusic:(NSString *)filename {

    if (!filename) {
        return;
    }
    AVAudioPlayer *player = _musicPlayers[filename];
    [player pause];
  
}
@end
