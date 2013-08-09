//
//  OAI_MailManager.m
//  Olympus_Project_Template
//
//  Created by Steve Suranie on 7/31/13.
//  Copyright (c) 2013 knowInk. All rights reserved.
//

#import "OAI_MailManager.h"

@implementation OAI_MailManager

+(OAI_MailManager *)sharedMailManager {
    
    static OAI_MailManager* sharedMailManager;
    
    @synchronized(self) {
        
        if (!sharedMailManager)
            
            sharedMailManager = [[OAI_MailManager alloc] init];
        
        return sharedMailManager;
        
    }
    
}


@end
