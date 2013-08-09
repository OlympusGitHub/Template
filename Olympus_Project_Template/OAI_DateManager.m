//
//  OAI_DateManager.m
//  Olympus_Project_Template
//
//  Created by Steve Suranie on 8/9/13.
//  Copyright (c) 2013 knowInk. All rights reserved.
//

#import "OAI_DateManager.h"

@implementation OAI_DateManager

+(OAI_DateManager *)sharedDateManager {
    
    static OAI_DateManager* sharedDateManager;
    
    @synchronized(self) {
        
        if (!sharedDateManager)
            
            sharedDateManager = [[OAI_DateManager alloc] init];
        
        return sharedDateManager;
        
    }
    
}

- (NSDate*) convertStringToDate : (NSString*) strToConvert {
    
}

- (NSString*) convertDateToString : (NSDate*) dateToConvert {
    
}

- (NSString*) getDateDifference : (NSString*) startDate : (NSString*) endDate {
    
}

- (NSArray*) getDatesInRange : (NSString*) startDate : (NSString*) endDate {
    

}



@end
