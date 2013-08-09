//
//  OAI_SplashScreen.h
//  OAI_IntegrationSiteReport_v1
//
//  Created by Steve Suranie on 11/14/12.
//  Copyright (c) 2012 Steve Suranie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OAI_ColorManager.h"
#import "OAI_FileManager.h"
#import "OAI_TitleScreen.h"

#import "OAI_AudioManager.h"

@interface OAI_SplashScreen : UIView {
    
    UIView* parentView;
    OAI_ColorManager* colorManager;
    OAI_FileManager* fileManager;
    OAI_AudioManager* sfxManager;
    
    //audio
    NSURL* olympusSoundURL;
    
    NSString* strVersion;
    
}

@property (nonatomic, retain) UIView* parentView;
@property (nonatomic, retain) OAI_TitleScreen* myTitleScreen;

- (void) runSplashScreenAnimation;

- (void) adjustForRotation : (UIDeviceOrientation*) orientation;

@end
