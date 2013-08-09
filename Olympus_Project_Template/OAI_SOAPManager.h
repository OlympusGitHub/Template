//
//  OAI_SOAPManager.h
//  OlympusConnectivty
//
//  Created by Steve Suranie on 7/24/13.
//  Copyright (c) 2013 knowInk. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "OAI_XMLConvertor.h"

@interface OAI_SOAPManager : NSObject <NSXMLParserDelegate>{
    
    OAI_XMLConvertor* xmlManager;
    
    NSMutableData *webData;
    NSXMLParser *xmlParser;
    NSString *finaldata;
    NSString *convertToStringData;
    NSMutableString *nodeContent;
    
    BOOL errorParsing;
    
    NSMutableDictionary* dictMasterData;
}

@property (nonatomic, retain) NSString* strSOAPCall;

- (void) initSOAPCall; 

@end
