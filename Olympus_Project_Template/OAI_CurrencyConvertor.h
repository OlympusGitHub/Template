//
//  OAI_CurrencyConvertor.h
//  MSGSP_v3
//
//  Created by Steve Suranie on 7/9/13.
//  Copyright (c) 2013 Olympus America. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OAI_CurrencyConvertor : NSObject

+(OAI_CurrencyConvertor* )sharedCurrencyConvetor;

- (NSString*) convertToCurrency : (NSDecimalNumber*) numberToConvert;

@end
