//
//  OAI_StringManager.m
//  Olympus_Project_Template
//
//  Created by Steve Suranie on 8/7/13.
//  Copyright (c) 2013 knowInk. All rights reserved.
//

#import "OAI_StringManager.h"

@implementation OAI_StringManager

+(OAI_StringManager *)sharedStringManager {
    
    static OAI_StringManager* sharedStringManager;
    
    @synchronized(self) {
        
        if (!sharedStringManager)
            
            sharedStringManager = [[OAI_StringManager alloc] init];
        
        return sharedStringManager;
        
    }
    
}



@end
