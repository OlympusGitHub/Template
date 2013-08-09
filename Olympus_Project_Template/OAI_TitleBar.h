//
//  OAI_TitleBar.h
//  AVI Site Integration
//
//  Created by Steve Suranie on 3/7/13.
//  Copyright (c) 2013 Olympus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "UIButton+ButtonWithImage.h"

@interface OAI_TitleBar : UIView {
    
    UIFont* titleFont;
    
}

@property (nonatomic, retain) NSString* titleBarTitle;
@property (nonatomic, assign) BOOL hasAccount;
@property (nonatomic, assign) BOOL hasReset;
@property (nonatomic, assign) BOOL hasHome;

- (void) buildTitleBar;

- (UIButton*) addButton : (UIButton*) buttonToAdd : (UIButton*) lastButton : (float) btnX : (CGRect) logoFrame : (NSString*) strButtonImage;

- (void) adjustForRotation : (UIDeviceOrientation*) orientation;

- (void) toggleAccount : (UIButton* ) btnAccount;

- (void) resetAll : (UIButton*) myButton;

@end
