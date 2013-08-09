//
//  OAI_ErrorBar.m
//  Olympus_Project_Template
//
//  Created by Steve Suranie on 7/29/13.
//  Copyright (c) 2013 knowInk. All rights reserved.
//

#import "OAI_ErrorBar.h"

@implementation OAI_ErrorBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        fontErrorMsg = [UIFont fontWithName:@"Helvetica-Bold" size:20];
        
        //add the label to hold the error message
        lblErrorMsg = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, self.frame.size.width-10.0, self.frame.size.height-10.0)];
        lblErrorMsg.textColor = [UIColor whiteColor];
        lblErrorMsg.font = fontErrorMsg;
        lblErrorMsg.backgroundColor = [UIColor clearColor];
        lblErrorMsg.numberOfLines = 0;
        lblErrorMsg.textAlignment = NSTextAlignmentLeft;
        lblErrorMsg.lineBreakMode = NSLineBreakByWordWrapping;
        [self addSubview:lblErrorMsg];
        
        self.userInteractionEnabled = YES;
        
        //add a tap gesture recognizer (use this to close the error message)
        UITapGestureRecognizer* selfTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleErrorBar:)];
        [self addGestureRecognizer:selfTap];
        
    }
    return self;
}

- (void) adjustForRotation : (UIDeviceOrientation*) orientation {
    
    //get the subviews
    NSArray* arrMySubviews = self.subviews;
    
    UILabel* lblMyErrorMsg;
    UIImageView* ivMyCaution;
    
    for(int i=0; i<arrMySubviews.count; i++) {
        
        if ([[arrMySubviews objectAtIndex:i] isMemberOfClass:[UILabel class]]) {
            lblMyErrorMsg = [arrMySubviews objectAtIndex:i];
        } else if ([[arrMySubviews objectAtIndex:i] isMemberOfClass:[UIImageView class]]) {
            ivMyCaution = [arrMySubviews objectAtIndex:i];
        }
    }
    
    //set the y location on whether the bar is displayed or not
    float myY = 0.0;
    UIView* vMyParent = self.superview;
    
    if (_isDisplayed) {
        myY = vMyParent.frame.size.height -51.0;
    } else {
        myY = vMyParent.frame.size.height + 1.0;
    }
    
    //resize the bar based on orientation
    if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation)) {
        
        [self setFrame:CGRectMake(0.0, myY, 1024.0, 50.0)];
        
    } else if (UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation)) {
        
        [self setFrame:CGRectMake(0.0, myY, 768.0, 50.0)];
        
    }
    
    //reset the location of the subviews
    [lblMyErrorMsg setFrame:CGRectMake(10.0, 10.0, self.frame.size.width-10.0, self.frame.size.height-10.0)];

    
    

}



- (void) toggleErrorBar : (UITapGestureRecognizer*) myGestureRecognizer {
    
    
    //get orientation
    float myY = 0.0;
    
    
    CGRect myFrame = self.frame;
    
    if (!_isDisplayed) {
        
        if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation)) {
            myY = 708.0;
            NSLog(@"wtf");
        } else if (UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation)) {
            myY = 974.0;
        }
        
        myFrame.origin.y = myY;
        
        //add the message
        lblErrorMsg.text = _strErrorMsg;
        
        _isDisplayed = YES;
        
    } else {
        
        if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation)) {
            myY = 769.0;
        } else if (UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation)) {
            myY = 1024.0;
        }
        
        myFrame.origin.y = myY;
        
        lblErrorMsg.text = nil;
        
        _isDisplayed = NO;
    
    }
    
    //animate to the new coordinates
    
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn
     
         animations:^{
             self.frame = myFrame;
         }

         completion:^ (BOOL finished) {
         }
     
     ];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
