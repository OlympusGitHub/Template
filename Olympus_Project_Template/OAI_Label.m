//
//  OAI_Label.m
//  MSGSP_v3
//
//  Created by Steve Suranie on 7/9/13.
//  Copyright (c) 2013 Olympus America. All rights reserved.
//

#import "OAI_Label.h"

@implementation OAI_Label

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        colorManager = [[OAI_ColorManager alloc] init];
        
        self.textColor = [colorManager setColor:66.0 :66.0 :66.0];
        self.textAlignment = NSTextAlignmentLeft;
        self.backgroundColor = [UIColor clearColor];
        self.numberOfLines = 0;
        self.lineBreakMode = NSLineBreakByWordWrapping;
        self.font = [UIFont fontWithName:@"Helvetica-Bold" size:14.0];
        
    }
    return self;
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
