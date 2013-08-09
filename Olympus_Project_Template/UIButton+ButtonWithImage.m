//
//  UIButton+ButtonWithImage.m
//  Olympus_Project_Template
//
//  Created by Steve Suranie on 7/23/13.
//  Copyright (c) 2013 knowInk. All rights reserved.


#import "UIButton+ButtonWithImage.h"

@implementation UIButton (ButtonWithImage)

- (void) buildImageButton : (NSString*) strImageName : (float) btnX {
    
    UIImage* imgButton = [UIImage imageNamed:strImageName];
    [self setFrame:CGRectMake(btnX, self.frame.origin.y, imgButton.size.width, imgButton.size.height)];
    [self setImage:imgButton forState:UIControlStateNormal];
    [self addTarget:self action:@selector(sendNotice:) forControlEvents:UIControlEventTouchUpInside];
    
    if ([strImageName rangeOfString:@"Account"].location != NSNotFound) {
        self.tag = 900;
    } else if ([strImageName rangeOfString:@"Reload"].location != NSNotFound) {
        self.tag = 901;
    } else if ([strImageName rangeOfString:@"Home"].location != NSNotFound) {
        self.tag = 902;
    }
    
}

- (void) sendNotice : (UIButton*) myButton {
    
    NSMutableDictionary* userData = [[NSMutableDictionary alloc] init];
    
    [userData setObject:@"Button Action" forKey:@"Action"];
    [userData setObject:self forKey:@"Button"];
    
    /*This is the call back to the notification center, */
    [[NSNotificationCenter defaultCenter] postNotificationName:@"theMessenger" object:self userInfo: userData];
    
}








@end
