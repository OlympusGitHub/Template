//
//  OAI_XMLConvertor.m
//  OlympusConnectivty
//
//  Created by Steve Suranie on 7/25/13.
//  Copyright (c) 2013 knowInk. All rights reserved.
//

//  Most of this code was gleaned from Troy Brant's XMLReader - http://troybrant.net/blog/2010/09/simple-xml-to-nsdictionary-converter/


#import "OAI_XMLConvertor.h"

NSString *const kXMLReaderTextNodeKey = @"text";

@implementation OAI_XMLConvertor

+(OAI_XMLConvertor *)sharedXMLConvertor {
    
    static OAI_XMLConvertor* sharedXMLConvertor;
    
    @synchronized(self) {
        
        if (!sharedXMLConvertor)
            
            sharedXMLConvertor = [[OAI_XMLConvertor alloc] init];
        
        return sharedXMLConvertor;
        
    }
    
}

- (NSDictionary*) parseXML {
    
    arrGarbage = [[NSArray alloc] initWithObjects:@"soap:Envelope", @"soap:Body", @"DiscountMP1Response", @"DiscountMP1Result", @"xs:schema", @"xs:element", @"xs:complexType",@"xs:choice", @"xs:element", 
                  @"xs:complexType", @"xs:sequence", @"xs:schema", @"diffgr:diffgram", @"dsSlsOps", nil];
    
    arrDictionaryStack = [[NSMutableArray alloc] init];
    textInProgress = [[NSMutableString alloc] init];
    
    // Initialize the stack with a fresh dictionary
    [arrDictionaryStack addObject:[NSMutableDictionary dictionary]];
    
    xmlParser = [[NSXMLParser alloc] initWithData:_webData];
    xmlParser.delegate = self;
    BOOL success = [xmlParser parse];
    
    // Return the stack’s root dictionary on success
    if (success) {
        NSDictionary* resultDict = [arrDictionaryStack objectAtIndex:0];
        return resultDict;
        
    } else {
        
        return nil;
    }

}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {
    
    //filter out the xs header stuff
    if (![arrGarbage containsObject:elementName]) { 
        
        // Get the dictionary for the current level in the stack
        NSMutableDictionary *parentDict = [arrDictionaryStack lastObject];
        
        // Create the child dictionary for the new element, and initilaize it with the attributes
        NSMutableDictionary *childDict = [NSMutableDictionary dictionary];
        [childDict addEntriesFromDictionary:attributeDict];
        
        // If there’s already an item for this key, it means we need to create an array
        id existingValue = [parentDict objectForKey:elementName];
        if (existingValue)
        {
            NSMutableArray *array = nil;
            if ([existingValue isKindOfClass:[NSMutableArray class]])
            {
                // The array exists, so use it
                array = (NSMutableArray *) existingValue;
            }
            else
            {
                // Create an array if it doesn’t exist
                array = [NSMutableArray array];
                [array addObject:existingValue];
                
                // Replace the child dictionary with an array of children dictionaries
                [parentDict setObject:array forKey:elementName];
            }
            
            // Add the new child dictionary to the array
            [array addObject:childDict];
        }
        else
        {
            // No existing value, so update the dictionary
            [parentDict setObject:childDict forKey:elementName];
        }
        
        // Update the stack
        [arrDictionaryStack addObject:childDict];
    }
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if (![arrGarbage containsObject:elementName]) { 
       
        // Update the parent dict with text info
        NSMutableDictionary *dictInProgress = [arrDictionaryStack lastObject];
        
        // Set the text property
        if ([textInProgress length] > 0)
        {
            // Get rid of leading + trailing whitespace
            [dictInProgress setObject:textInProgress forKey:kXMLReaderTextNodeKey];
            
            // Reset the text
            textInProgress = [[NSMutableString alloc] init];
        }
        
        // Pop the current dict
        [arrDictionaryStack removeLastObject];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
   [textInProgress appendString:string];
    
}

#pragma mark - NSXMLParserDelegate methods


@end
