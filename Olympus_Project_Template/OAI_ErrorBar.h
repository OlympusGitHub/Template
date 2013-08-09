//
//  OAI_ErrorBar.h
//  Olympus_Project_Template
//
//  Created by Steve Suranie on 7/29/13.
//  Copyright (c) 2013 knowInk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OAI_ErrorBar : UIView {
    
    UILabel* lblErrorMsg;
    UIFont* fontErrorMsg;
    
}

@property (nonatomic, retain) NSString* strErrorMsg;
@property (nonatomic, assign) BOOL isDisplayed;

- (void) toggleErrorBar : (UITapGestureRecognizer*) myGestureRecognizer;

- (void) adjustForRotation : (UIDeviceOrientation*) orientation;

@end
