//
//  ViewController.m
//  Olympus_Project_Template
//
//  Created by Steve Suranie on 7/23/13.
//  Copyright (c) 2013 knowInk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
	
    //notification for device rotation
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    //notification center for incoming messages
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"message"object:nil];
    
    //notification for network status change
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNetworkChange:) name:kReachabilityChangedNotification object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:kReachabilityChangedNotification object:nil];
    
    //init managers
    sfxManager = [[OAI_AudioManager alloc] init];
    colorManager = [[OAI_ColorManager alloc] init];
    fileManager = [[OAI_FileManager alloc] init];
    currencyConvertor = [[OAI_CurrencyConvertor alloc] init];
    soapManager = [[OAI_SOAPManager alloc] init];
    xmlManager = [[OAI_XMLConvertor alloc] init];
    stringManager = [[OAI_StringManager alloc] init];
    mailManager = [[OAI_MailManager alloc] init];
    numberManager = [[OAI_NumberManager alloc] init];
    
    reachability = [Reachability reachabilityForInternetConnection];
    
    //make sure we have access
    [reachability startNotifier];
    
    //add the title bar
    titleBar = [[OAI_TitleBar alloc] initWithFrame:CGRectMake(0.0, 0.0, 1024.0, 50.0)];
    titleBar.titleBarTitle = @"OAI Template";
    titleBar.hasAccount = YES;
    titleBar.hasReset = YES;
    titleBar.hasHome = YES;
    [titleBar buildTitleBar];
    [self.view addSubview:titleBar];
    
    UIButton* btnMakeSoapCall = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnMakeSoapCall setTitle:@"Get XML" forState:UIControlStateNormal];
    [btnMakeSoapCall addTarget:self action:@selector(getXML:) forControlEvents:UIControlEventTouchUpInside];
    [btnMakeSoapCall setFrame:CGRectMake(30.0, titleBar.frame.origin.y + titleBar.frame.size.height + 20.0, 100.0, 30.0)];
    [self.view addSubview:btnMakeSoapCall];
    
    //add the title screen
    titleScreen = [[OAI_TitleScreen alloc] initWithFrame:CGRectMake(0.0, 0.0, 1024.0, 768.0)];
    titleScreen.strAppTitle = @"OAIMDT Application Template";
    titleScreen.hasTitle = YES;
    titleScreen.hasImage = YES;
    titleScreen.strImageName = @"imgPlaceholder.png";
    [titleScreen buildTitleScreen];
    [self.view addSubview:titleScreen];
    
    //add the splash screen
    splashScreen = [[OAI_SplashScreen alloc] initWithFrame:CGRectMake(0.0, 0.0, 1024.0, 768.0)];
    splashScreen.myTitleScreen = titleScreen;
    [splashScreen runSplashScreenAnimation];
    [self.view addSubview:splashScreen];
    
    //add the error bar
    errorBar = [[OAI_ErrorBar alloc] initWithFrame:CGRectMake(0.0, self.view.frame.size.height + 1.0, self.view.frame.size.width, 50.0)];
    errorBar.backgroundColor = [colorManager setColor:8.0 :64.0 :14.0];
    errorBar.isDisplayed = NO;
    [self.view addSubview:errorBar];
    
    //check connectivity
    [self checkConnectivity];
    
    //test number manager
    //NSDecimalNumber* decTestNumber = [numberManager convertToNSDecimal:@"123"];
    //NSString* strTestNumberAsCurrency = [currencyConvertor convertToCurrency:decTestNumber];
    
}

#pragma mark - Notification Center
- (void) receiveNotification:(NSNotification* ) notification {
    
    if ([[notification name] isEqualToString:@"message"]) {
        
        //get the event
        NSString* theEvent = [[notification userInfo] objectForKey:@"Action"];
        
        if ([theEvent isEqualToString:@""]) {
            //do something based on event
        }
    }
}

#pragma mark - Check Connectivity

- (void) checkConnectivity {
    
    NetworkStatus remoteHostStatus = [Reachability reachabilityWithHostName: @"http://www.olympus-global.com/en/"];

    if(remoteHostStatus == NotReachable) {
        
        //set the bool
        isConnected = NO;
        
        //set error message
        errorBar.strErrorMsg = @"You are not connected to the internet. Functionality within this app will now be limited.";
        
        //display error bar
        //drop in UIAlertView code here
        
    } else if (remoteHostStatus == ReachableViaWiFi) {
        
        //do something for wifi connection
        
    } else if (remoteHostStatus == ReachableViaWWAN) {
        
        //do something for wan connection
        
    }
    
}

- (void) handleNetworkChange : (NSNotification*) notification {
    
    NetworkStatus remoteHostStatus = [Reachability reachabilityWithHostName: @"http://www.olympus-global.com/en/"];
    
    if(remoteHostStatus == NotReachable) {
        
        //set the bool
        isConnected = NO;
        
        //set error message
        errorBar.strErrorMsg = @"You are not connected to the internet. Functionality within this app will now be limited.";
        
        //display error bar
        //drop in UIAlertView code here
        
    } else if (remoteHostStatus == ReachableViaWiFi) {
        
        NSLog(@"wifi - network changed");
        //do something for wifi connection
        
    } else if (remoteHostStatus == ReachableViaWWAN) {
        
        NSLog(@"cell - network changed");
        //do something for wan connection
    }
    
}

#pragma mark - SOAP Methods

- (void) getXML : (UIButton*) myButton {
    
    /*the soap manager will try to connect to the wsdl and get the returned data, this data will then
     be sent to the xmlManager to be parsed into a dictionary and then returned to the notification
     center here in the vc*/
    
    //check for vpn connection here before we try to call the wsdl
    if (isConnected) { 
    
        //this is where you would pass the soap format to the soap manager class
        NSString* strSOAPCall = @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
        "<soap:Body>\n"
        "<DiscountMP1Response xmlns=\"http://SlsOpsMsg.org/\">\n"
        "<DiscountMP1Result>\n"
        "<xsd:schema>schema</xsd:schema>xml</DiscountMP1Result>\n"
        "</DiscountMP1Response>\n"
        "</soap:Body></soap:Envelope>\n";
        
        soapManager.strSOAPCall = strSOAPCall;
        [soapManager initSOAPCall];
        
    }
    
    
}

#pragma mark - Orientation Changed Methods
- (void) deviceOrientationDidChange : (UIDeviceOrientation*) orientation {
    
    //call the rotation management methods of various classes
    [splashScreen adjustForRotation:orientation];
    [titleScreen adjustForRotation:orientation];
    [titleBar adjustForRotation:orientation];
    [errorBar adjustForRotation:orientation];
     
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    
    return interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight;
}

#pragma mark - Default Methods



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
