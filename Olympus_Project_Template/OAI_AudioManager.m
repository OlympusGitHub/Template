//
//  KIP_AudioManager.m
//  KIP_CollisionTest
//
//  Created by Steve Suranie on 6/25/13.
//  Copyright (c) 2013 FatElvisGames. All rights reserved.
//

#import "OAI_AudioManager.h"

@implementation OAI_AudioManager

+(OAI_AudioManager *)sharedAudioManager {
    
    static OAI_AudioManager* sharedAudioManager;
    
    @synchronized(self) {
        
        if (!sharedAudioManager)
            
            sharedAudioManager = [[OAI_AudioManager alloc] init];
        
        return sharedAudioManager;
        
    }
    
}

- (void) playSound : (NSString*) strSoundFileName {
    
    NSString *path = [NSString stringWithFormat: @"%@/%@",
                      [[NSBundle mainBundle] resourcePath], strSoundFileName];
    
    
    NSURL* filePath = [NSURL fileURLWithPath: path isDirectory: NO];
    SystemSoundID soundID;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)filePath, &soundID);
    
    AudioServicesPlaySystemSound(soundID);
    
}

@end
