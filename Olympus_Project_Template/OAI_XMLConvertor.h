//
//  OAI_XMLConvertor.h
//  OlympusConnectivty
//
//  Created by Steve Suranie on 7/25/13.
//  Copyright (c) 2013 knowInk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OAI_XMLConvertor : NSObject <NSXMLParserDelegate> {
    
    NSMutableDictionary* dictMaster;
    NSXMLParser* xmlParser;
    NSArray* arrGarbage;
    NSMutableArray* arrDictionaryStack;
    NSMutableString* textInProgress;

}

@property (nonatomic, retain) NSData* webData;
    

+(OAI_XMLConvertor* )sharedXMLConvertor;

- (NSDictionary*) parseXML;



@end
