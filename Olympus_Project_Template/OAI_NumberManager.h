//
//  OAI_NumberManager.h
//  Olympus_Project_Template
//
//  Created by Steve Suranie on 8/7/13.
//  Copyright (c) 2013 knowInk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OAI_NumberManager : NSObject

+(OAI_NumberManager* )sharedNumberManager;

- (NSDecimalNumber*) convertToNSDecimal : (NSString*) strToConvert;

- (NSString*) convertToPercentage : (NSString*) strToConvert;

- (NSString*) stripDollarSymbol : (NSString*) strToClean;

- (NSString*) stripDecimalPoints : (NSString*) strToClean;

- (NSString*) stripPercentageSymbols : (NSString*) strToClean;

- (NSString*) stripSymbols : (NSString*) strToClean;

- (NSString*) stripAlphaCharacters : (NSString*) strToClean;



@end
