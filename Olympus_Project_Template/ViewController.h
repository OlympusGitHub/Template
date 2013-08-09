//
//  ViewController.h
//  Olympus_Project_Template
//
//  Created by Steve Suranie on 7/23/13.
//  Copyright (c) 2013 knowInk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "OAI_AudioManager.h"
#import "OAI_ColorManager.h"
#import "OAI_CurrencyConvertor.h"
#import "OAI_FileManager.h"
#import "OAI_SplashScreen.h"
#import "OAI_TitleBar.h"
#import "OAI_TitleScreen.h"
#import "OAI_SOAPManager.h"
#import "OAI_XMLConvertor.h"
#import "OAI_ErrorBar.h"
#import "OAI_StringManager.h"
#import "OAI_MailManager.h"
#import "OAI_NumberManager.h"

#import "OAI_Label.h"

#import "Reachability.h"

@interface ViewController : UIViewController {
    
    OAI_AudioManager* sfxManager;
    OAI_ColorManager* colorManager;
    OAI_CurrencyConvertor* currencyConvertor;
    OAI_FileManager* fileManager;
    OAI_SplashScreen* splashScreen;
    OAI_TitleBar* titleBar;
    OAI_TitleScreen* titleScreen;
    OAI_SOAPManager* soapManager;
    OAI_XMLConvertor* xmlManager;
    OAI_ErrorBar* errorBar;
    OAI_StringManager* stringManager;
    OAI_MailManager* mailManager;
    OAI_NumberManager* numberManager;
    
    //connectivity ivars
    Reachability* reachability;
    BOOL isConnected;
    NSString* strConnectionType;
    NSString* strConnectionIP;
    
}

- (void) checkConnectivity; 

- (void) getXML : (UIButton*) myButton; 

- (void) deviceOrientationDidChange : (UIDeviceOrientation*) orientation;

@end
