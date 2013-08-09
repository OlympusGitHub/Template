//
//  KIP_AudioManager.h
//  KIP_CollisionTest
//
//  Created by Steve Suranie on 6/25/13.
//  Copyright (c) 2013 FatElvisGames. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface OAI_AudioManager : NSObject

+(OAI_AudioManager* )sharedAudioManager;

- (void) playSound : (NSString*) strSoundFileName;

@end
