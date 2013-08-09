//
//  OAI_CurrencyConvertor.m
//  MSGSP_v3
//
//  Created by Steve Suranie on 7/9/13.
//  Copyright (c) 2013 Olympus America. All rights reserved.
//

#import "OAI_CurrencyConvertor.h"

@implementation OAI_CurrencyConvertor


+(OAI_CurrencyConvertor *)sharedCurrencyConvetor {
    
    static OAI_CurrencyConvertor* sharedCurrencyConvetor;
    
    @synchronized(self) {
        
        if (!sharedCurrencyConvetor)
            
            sharedCurrencyConvetor = [[OAI_CurrencyConvertor alloc] init];
        
        return sharedCurrencyConvetor;
        
    }
    
}

- (NSString*) convertToCurrency : (NSDecimalNumber*) decNumberToConvert {
        
        //convert to string
    NSString* currencyString = [NSNumberFormatter localizedStringFromNumber:decNumberToConvert numberStyle:NSNumberFormatterCurrencyStyle];
    
    return currencyString;
    
}


@end
