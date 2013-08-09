//
//  UIButton+ButtonWithImage.h
//  Olympus_Project_Template
//
//  Created by Steve Suranie on 7/23/13.
//  Copyright (c) 2013 knowInk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ButtonWithImage)

- (void) buildImageButton : (NSString*) strImageName : (float) btnX;

- (void) sendNotice : (UIButton*) myButton;

@end
