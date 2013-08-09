//
//  OAI_SOAPManager.m
//  OlympusConnectivty
//
//  Created by Steve Suranie on 7/24/13.
//  Copyright (c) 2013 knowInk. All rights reserved.
//

#import "OAI_SOAPManager.h"

@implementation OAI_SOAPManager

- (void) initSOAPCall {
    
    //init a dictionary to hold the returned data
    dictMasterData = [[NSMutableDictionary alloc] init];
    
    xmlManager = [[OAI_XMLConvertor alloc] init];
    
    //the location of our WSDL site
    NSURL* locationOfWebService = [NSURL URLWithString:@"http://10.160.112.198/slsops/rptTest1.asmx?op=DiscountMP1"];
    
    //the request
    NSMutableURLRequest* theRequest = [[NSMutableURLRequest alloc]initWithURL:locationOfWebService];
    
    NSString* msgLength = [NSString stringWithFormat:@"%d",[_strSOAPCall length]];
    
    [theRequest addValue:@"text/xml" forHTTPHeaderField:@"Content-Type"];
    [theRequest addValue:@"http://SlsOpsMsg.org/DiscountMP1" forHTTPHeaderField:@"SOAPAction"];
    [theRequest addValue:msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    
    //the below encoding is used to send data over the net
    [theRequest setHTTPBody:[_strSOAPCall dataUsingEncoding:NSUTF8StringEncoding]];
    
    //make the url connection (will it need to authenticate?)
    NSURLConnection* connect = [[NSURLConnection alloc]initWithRequest:theRequest delegate:self];
    
    //if the connection is successful then init our NSData object
    if (connect) {
        webData = [[NSMutableData alloc]init];
    } else {
        NSLog(@"No Connection established");
    }

    
}

#pragma mark - Data Management

- (void) parseXML {
    
    //pass data to xml parser
    xmlManager.webData = webData;
    NSDictionary* dictXMLData = [xmlManager parseXML];
    
    if (dictXMLData) { 

        //pass the returned data back to the notification center
        NSMutableDictionary* userData = [[NSMutableDictionary alloc] init];
        
        [userData setObject:@"Display Data" forKey:@"Action"];
        [userData setObject:dictXMLData forKey:@"Data"];
        
        //This is the call back to the notification center
        [[NSNotificationCenter defaultCenter] postNotificationName:@"message" object:self userInfo: userData];
        
    } else {
        
        
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Data Retrieval Error" message:@"There was an error in getting the data." delegate:nil cancelButtonTitle:@"YES" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    
}

#pragma mark - NSURLConnection Methods

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
    [webData setLength: 0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
    //if we received data back from the sharepoint site, append it to our NSData object
    [webData appendData:data];
    
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    //oops
    NSLog(@"%@", error);
}

-(BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace {
    //do we have to authenticate?
    return YES;
}

-(void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
    
    //did the site request credentials?
    NSURLCredential *credential = [NSURLCredential credentialWithUser:@"surans" password:@"Olympus*2013" persistence:NSURLCredentialPersistenceForSession];
    [[challenge sender] useCredential:credential forAuthenticationChallenge:challenge];
}


-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    //hold on for debugging
    /*NSLog(@"DONE. Received Bytes: %d", [webData length]);
     NSString* theXML = [[NSString alloc] initWithBytes: [webData mutableBytes] length:[webData length] encoding:NSUTF8StringEncoding];
     NSLog(@"*************\n\n%@\n\n",theXML);*/
    
    //parse the returned xml
    xmlParser = [[NSXMLParser alloc] initWithData:webData];
    xmlParser.delegate = self;
    BOOL isFinishedParsing = [xmlParser parse];
    
    if (isFinishedParsing) {
        [self parseXML];
    }
    
}




@end
