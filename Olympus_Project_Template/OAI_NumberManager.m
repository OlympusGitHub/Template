//
//  OAI_NumberManager.m
//  Olympus_Project_Template
//
//  Created by Steve Suranie on 8/7/13.
//  Copyright (c) 2013 knowInk. All rights reserved.
//

#import "OAI_NumberManager.h"

@implementation OAI_NumberManager

+(OAI_NumberManager *)sharedNumberManager {
    
    static OAI_NumberManager* sharedNumberManager;
    
    @synchronized(self) {
        
        if (!sharedNumberManager)
            
            sharedNumberManager = [[OAI_NumberManager alloc] init];
        
        return sharedNumberManager;
        
    }
    
}

- (NSDecimalNumber*) convertToNSDecimal : (NSString*) strToConvert {
    
    /*most of the time you would be using this to convert textfield string to currency. So you would take the textfield.text, validate it, convert to NSDecNum and then use the currency convertor to change to a currency*/
    
    //set some ivars
    BOOL hasError = NO;
    
    NSMutableString* strErrMsg = [[NSMutableString alloc] initWithString:@"There was an error formatting the passed value:\n"];
    
    NSDecimalNumber* decMyNum;
    
    //make sure the value passed is a string
    if ([strToConvert isKindOfClass:[NSString class]]) {
        
        //make sure the value passed is numeric only
        NSCharacterSet* setAlphabetAndSymbols = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
        setAlphabetAndSymbols = [setAlphabetAndSymbols invertedSet];
        NSRange r = [strToConvert rangeOfCharacterFromSet:setAlphabetAndSymbols];
        
        if (r.location != NSNotFound) {
            hasError = YES;
        }
        
        
        if (!hasError) {
            //convert to NSDecimalNumber
            decMyNum = [[NSDecimalNumber alloc] initWithString:strToConvert];
        } else {
            [strErrMsg appendString:@"The value passed is not a number. It has letters or symbols included in it"];
        }
        
    } else {
        
        hasError = YES;
        [strErrMsg appendString:@"The value passed is not in a string format"];
    }
    
    
    //check the hasError value
    if (hasError) {
        NSLog(@"%@\n%@", strErrMsg, strToConvert);
    } else {
        return decMyNum;
    }
    
    return nil;
}

- (NSString*) convertToPercentage : (NSString*) strToConvert  {
    
    float myNumberToConvert;
    BOOL hasError = NO;
    NSMutableString* strErrMsg = [[NSMutableString alloc] initWithString:@"There was an error formatting the passed value:\n"];
    
    if (strToConvert) {
        
        //check to make sure the string value passed is numeric
        //make sure the value passed is numeric only
        NSCharacterSet* setAlphabetAndSymbols = [NSCharacterSet characterSetWithCharactersInString:@".0123456789"];
        setAlphabetAndSymbols = [setAlphabetAndSymbols invertedSet];
        NSRange r = [strToConvert rangeOfCharacterFromSet:setAlphabetAndSymbols];
        
        if (r.location != NSNotFound) {
            hasError = YES;
            [strErrMsg appendString:@"The value passed was not a number, it contained letters and/or symbols."];
        } else {
            myNumberToConvert = [strToConvert floatValue];
        }
        
        
        //check to see if there was an error
        if (!hasError) {
            
            if (myNumberToConvert > 0) { 
                myNumberToConvert = myNumberToConvert/100;
            }
            
            NSString* strPercentage = [NSString stringWithFormat:@"%.02f%%", myNumberToConvert];
            return strPercentage;
            
        } else {
            
            NSLog(@"%@", strErrMsg);
            
        }

    }

    return nil;
    
}

- (NSString*) stripDollarSymbol : (NSString*) strToClean {
    
    //check to see if the number is already formatted correctly
    NSRange dollarSignCheck = [strToClean rangeOfString:@"$"];
    
    //only strip it if it has the $
    if (dollarSignCheck.location != NSNotFound) {
        
        NSString* cleanedString = [strToClean substringWithRange:NSMakeRange(1, strToClean.length-1)];
        
        return cleanedString;
    }
    
    return nil;
    
}

- (NSString*) stripDecimalPoints : (NSString*) strToClean {
    
    //check to see if the number is already formatted correctly
    NSRange decimalCheck = [strToClean rangeOfString:@"."];
    
    //only strip it if it has the decimal
    if (decimalCheck.location != NSNotFound) {
        
        NSRange endRange = [strToClean rangeOfString:@"."];
        NSString* cleanedString = [strToClean substringWithRange:NSMakeRange(0, endRange.location)];
        return cleanedString;
    }
    
    return nil;
    
}

- (NSString*) stripPercentageSymbols : (NSString*) strToClean {
    
    //check to see if the number is already formatted correctly
    NSRange percentSignCheck = [strToClean rangeOfString:@"%"];
    
    //only strip it if it has the $
    if (percentSignCheck.location != NSNotFound) {
        
        
        NSString* cleanedString = [strToClean substringWithRange:NSMakeRange(0, strToClean.length-1)];
        
        return cleanedString;
    }
    
    return nil;
    
}



- (NSString*) stripAlphaCharacters : (NSString*) strToClean {
    
    //strip away $ and % signs
    NSString * thisCleanedString = [strToClean stringByReplacingOccurrencesOfString:@"[^0-9]" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, [strToClean length])];
    
    return thisCleanedString;
    

}

@end
