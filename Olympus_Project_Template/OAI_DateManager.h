//
//  OAI_DateManager.h
//  Olympus_Project_Template
//
//  Created by Steve Suranie on 8/9/13.
//  Copyright (c) 2013 knowInk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OAI_DateManager : NSObject {
    
    NSDateFormatter* dateFormatter;
    
}

+(OAI_DateManager* )sharedDateManager;

- (NSDate*) convertStringToDate : (NSString*) strToConvert;

- (NSString*) convertDateToString : (NSDate*) dateToConvert;

- (NSString*) getDateDifference : (NSString*) startDate : (NSString*) endDate;

- (NSArray*) getDatesInRange : (NSString*) startDate : (NSString*) endDate; 

@end
