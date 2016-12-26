//
//  FacemouthAppDelegate.m
//  Facemouth
//
//  Created by thedjnK on 18/03/2013.
//  Version 0.1, Updated 27/03/2013.
//  Copyright 2013 Failparty. All rights reserved.
//

#import "FacemouthAppDelegate.h"

    //[(id)context performSelectorOnMainThread:@selector(reportButton2:)withObject:[NSArray arrayWithObjects:[NSNumber numberWithInt:ind], [NSNumber numberWithInt:val], nil] waitUntilDone:NO];
/*
 Inbox?     http://www.facemouth.co.uk/api.php?format=json&type=messagein&snum=0&num=1
 Outbox?    http://www.facemouth.co.uk/api.php?format=json&type=messageout&snum=0&num=1
 Topics?    http://www.facemouth.co.uk/api.php?format=json&type=topic&snum=0&num=10
 Posts?     http://www.facemouth.co.uk/api.php?format=json&type=post&snum=0&num=10&=tid=1000
 Users?     http://www.facemouth.co.uk/api.php?format=json&type=users&snum=0&num=100
 User?      http://www.facemouth.co.uk/api.php?format=json&type=userid&idnum=1
 Reply:
 topic.php?id=x
 reply-content=x
 */

@implementation FacemouthAppDelegate

@synthesize windcnt;
@synthesize window;
@synthesize fmUser;
@synthesize fmPass;
@synthesize fmLoginBtn;
@synthesize fmLoginSpn;
@synthesize fmViewController;
@synthesize fmTestView;
@synthesize fmNormalView;
@synthesize fmBSWIN;
@synthesize fmTESTOBJ;
@synthesize fmThreadWindow;
@synthesize fmThreadTest;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    window.display;
    window.becomeMainWindow;
    window.center;
    window.contentView;
/*
 window.frame.size.height
 window.frame.size.width
 */
//    [_aaTST1 setDataSource:_MyTableController];
    /* HTTP Request Initialisation */
//    CallbackFunction = [[NSString alloc] init];
    HTTPURL = [[NSString alloc] init];
    HTTPRedirectURL = [[NSString alloc] init];
    
    //TEST!
    PicsToGet = [[NSMutableArray alloc] init];
//    FacemouthCookies = [[NSString alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    /*
     */
//    responseData = [[NSMutableData alloc] init];
//    responseURL = [[NSURL alloc] init];
//    responseURL = [response URL];
    NSLog(@"URL: %@", [[response URL] query]);
    HTTPResponseData = [[NSMutableData alloc] init];
/*    NSHTTPURLResponse *HTTPResponse = (NSHTTPURLResponse *)response;
    NSDictionary *fields = [HTTPResponse allHeaderFields];
    NSString *cookie = [fields valueForKey:@"Set-Cookie"]; // It is your cookie*/
    if (UpdateCookies == true)
    {
        NSHTTPURLResponse *HTTPResponse = (NSHTTPURLResponse *)response;
         NSDictionary *fields = [HTTPResponse allHeaderFields];
         NSString *cookie = [fields valueForKey:@"Set-Cookie"]; // It is your cookie
//        if ([[(NSDictionary *)[(NSHTTPURLResponse *)response allHeaderFields] valueForKey:@"Set-Cookie"] length] > 6)
        if ([cookie length] > 6)
        {
            if (FacemouthCookies)
            {
                [FacemouthCookies release];
            }
//            FacemouthCookies = [NSMutableString stringWithFormat:@"%@", cookie];
//            FacemouthCookies = [FacemouthCookies stringByReplacingOccurrencesOfRegex:@"path=(.*?)(\\s|;|$)" withString:@""];
//            FacemouthCookies = [FacemouthCookies substringToIndex:([FacemouthCookies length]-1)];
cookie = [cookie stringByReplacingOccurrencesOfRegex:@"path=(.*?)(\\s|;|$)" withString:@""];
cookie = [cookie stringByReplacingOccurrencesOfRegex:@"\\s\\s" withString:@" "];
cookie = [cookie stringByReplacingOccurrencesOfRegex:@"\\s\\s" withString:@" "];
cookie = [cookie substringToIndex:([cookie length]-2)];
                FacemouthCookies = [[NSString alloc] initWithFormat:@"%@", cookie];
//NSLog(@"UPDATE COOKIES! [%@]", FacemouthCookies);
        }
    }
//    NSLog(@"COOKRIE %@", cookie);
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    /*
     */
//      [responseData appendData:data];
    [HTTPResponseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    /*
     */
//    [responseData release];
//    [connection release];
//    if (HTTPFuncNum == 1)
//    {
        //Login form
        [fmLoginSpn stopAnimation:0];
//    }
    
    NSLog(@"HTTP ERROR! %@", [error localizedDescription]);

    [HTTPResponseData release];
    [HTTPConnection release];
    [HTTPURLRequest release];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    /*
     */
/*    for (NSHTTPCookie *cookie in [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies])
    {
        NSLog(@"name: '%@'\n",   [cookie name]);
        NSLog(@"value: '%@'\n",  [cookie value]);
        NSLog(@"domain: '%@'\n", [cookie domain]);
        NSLog(@"path: '%@'\n",   [cookie path]);
    }*/

//    NSLog(@"Succeeded! Received %lu bytes of data",[responseData length]);
//    NSLog(@"Succeeded! Received %lu bytes of data;\r\n%@", [HTTPResponseData length], [[[NSString alloc] initWithData:HTTPResponseData encoding: NSASCIIStringEncoding]autorelease]);
    NSLog(@"Succeeded! Received %lu bytes of data.", [HTTPResponseData length]);
NSLog(@"COO [%@]", FacemouthCookies);
        [fmLoginSpn stopAnimation:0];
    if (HTTPFuncNum == 1)
    {
        //Login form
//        [fmLoginSpn stopAnimation:0];
        NSString *CheckLogin = [[[NSString alloc] initWithData:HTTPResponseData encoding: NSASCIIStringEncoding] autorelease];
        if ([CheckLogin rangeOfString:@"You have supplied a wrong"].location != NSNotFound || [CheckLogin rangeOfString:@"Please try again"].location != NSNotFound)
        {
            //Invalid login
            _fmLoginStatus.stringValue = @"[Invalid; Please retype]";
        }
        else if ([CheckLogin rangeOfString:@"Welcome,"].location != NSNotFound && [CheckLogin rangeOfString:@"Proceed to"].location != NSNotFound)
        {
            //Correct login!
//            NSArray *lolwtf = [CheckLogin componentsSeparatedByRegex:@"/Welcome, (.*?)Proceed to/"];
            NSArray *lolwtf = [[[NSArray alloc] initWithArray:[CheckLogin componentsSeparatedByRegex:@"Welcome, (.*?)[.]"]] autorelease];
            if ([lolwtf count] == 3)
            {
                //We can get the username!
                FacemouthUsername = [[NSString alloc] initWithString:[lolwtf objectAtIndex:1]];
            }
            else
            {
                //Unable to get username, just use the same as the entered value.
                FacemouthUsername = [[NSString alloc] initWithString:fmUser.stringValue];
            }

            //Update the last session check with the current time
            fmSessionUpdated = (unsigned int)[[NSDate date] timeIntervalSince1970];
            _fmLoginStatus.stringValue = [NSString stringWithFormat:@"[Transferring, %@]", FacemouthUsername];
            
            //Now fire a request to get extra user information
/*            SEL theSelector = NSSelectorFromString(@"HTTPRequest:withURL:withPOSTData:withFuncNum:");
            NSInvocation *anInvocation = [NSInvocation
                                          invocationWithMethodSignature:
                                          [MPMoviePlayerController instanceMethodSignatureForSelector:theSelector]];
            [anInvocation setSelector:theSelector];
            [anInvocation setTarget:theMovie];
            UIInterfaceOrientation val = UIInterfaceOrientationPortrait;
            BOOL anim = NO;
            [anInvocation setArgument:&val atIndex:2];
            [anInvocation setArgument:&anim atIndex:3];
            
            [anInvocation performSelector:@selector(invoke) withObject:nil afterDelay:1];*/
            
//            [self performSelector:@selector(HTTPRequest:FALSE withURL:@"http://www.facemouth.co.uk/" withPOSTData:nil:withFuncNum:3) withObject:self afterDelay:1];
//            [self performSelector:@selector(GAYFUNC) withObject:nil afterDelay:1];
//            [self performSelector:@selector(HTTPRequestX:) withObject:[[NSArray alloc] initWithObjects:@"0", @"http://www.facemouth.co.uk", @"", @"3", self, nil] afterDelay:1];
[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(HTTPTimerRequest:) userInfo:[[[NSArray alloc] initWithObjects:@"0", @"http://www.facemouth.co.uk", @"", @"3", @"0", self, nil] autorelease] repeats:NO];
//NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(HTTPRequestX:) userInfo:nil repeats:NO];
//            [self HTTPRequest:TRUE withURL:@ withPOSTData:nil withFuncNum:3];
            
            //And show the threads window
            [fmBSWIN makeKeyAndOrderFront:fmBSWIN];
            fmBSWIN.center;
            fmBSWIN.contentView;
        }
        else
        {
            //Unknown?
            _fmLoginStatus.stringValue = @"[Unknown Error]";
        }
    }
else if (HTTPFuncNum == 9)
{
//TESTING REPLY
NSString *txt = [[[NSString alloc] initWithData:HTTPResponseData encoding: NSASCIIStringEncoding]autorelease];
NSLog(@"Y U NO POST!?!?!? %@", txt);
}
    else if (HTTPFuncNum == 2)
    {
        //Threads
    NSString *txt = [[[NSString alloc] initWithData:HTTPResponseData encoding: NSASCIIStringEncoding]autorelease];
//    fmTESTOBJ.string = txt;
    JSONParser = [[SBJsonParser alloc] init];
    id jsonObject = [JSONParser objectWithString:txt];
    if ([jsonObject respondsToSelector:@selector(objectForKey:)])
    {
        for (NSDictionary *tweet in [jsonObject objectForKey:@"topics"])
        {
            fmTESTOBJ.string = [NSString stringWithFormat:@"%@%@%@%@%@%@\r\n", fmTESTOBJ.string, [[tweet objectForKey:@"post"] objectForKey:@"topic_subject"],  [[tweet objectForKey:@"post"] objectForKey:@"topic_user"],  [[tweet objectForKey:@"post"] objectForKey:@"topic_postcount"], [[tweet objectForKey:@"post"] objectForKey:@"topic_date"], [[tweet objectForKey:@"post"] objectForKey:@"topic_id"]];
/*
 isgold = 0;
 "topic_by" = 38;
 "topic_cat" = 1;
 "topic_date" = "2013-03-24 18:40:14";
 "topic_id" = 1006559;
 "topic_postcount" = 26;
 "topic_subject" = "Can you recommend me a pc or laptop?";
 "topic_user" = bannednun;
 */
//[ThreadData addObject:[[Threads alloc] init]];
//[_aaTST2 setCollection:[NSString stringWithFormat:@"%@%@", @"wtf:", [tweet objectForKey:@"topic_subject"]]
            [_aaTST2 AddThreadToList:[[[tweet objectForKey:@"post"] objectForKey:@"topic_id"] intValue] withPosts:[[[tweet objectForKey:@"post"] objectForKey:@"topic_postcount"] intValue] withCat:[[[tweet objectForKey:@"post"] objectForKey:@"topic_cat"] intValue] withUserID:[[[tweet objectForKey:@"post"] objectForKey:@"topic_by"] intValue] withTitle:[[tweet objectForKey:@"post"] objectForKey:@"topic_subject"] withUser:[[tweet objectForKey:@"post"] objectForKey:@"topic_user"] withDate:[NSDate dateWithString:[NSString stringWithFormat:@"%@ +0000", [[tweet objectForKey:@"post"] objectForKey:@"topic_date"]]]];
if ([PicsToGet containsObject:[NSNumber numberWithInt:[[[tweet objectForKey:@"post"] objectForKey:@"topic_by"] intValue]]])
{
}
else
{
[PicsToGet addObject:[NSNumber numberWithInt:[[[tweet objectForKey:@"post"] objectForKey:@"topic_by"] intValue]]];
}
        }
if ([PicsToGet count] > 0)
{
    //We have pics to get! Schedule a timer.
    LoopCounter = 0;
[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(HTTPTimerRequest:) userInfo:[[[NSArray alloc] initWithObjects:@"0", [NSString stringWithFormat:@"http://www.facemouth.co.uk/api.php?format=json&type=userid&idnum=%d", [[PicsToGet objectAtIndex:0] intValue]], @"", @"6", @"0", self, nil] autorelease] repeats:NO];
}
NSLog(@"IT HAS %ld ITEMS!", (unsigned long)[PicsToGet count]);
    }
        [JSONParser release];
    
    //Remove blocked users from the list
     //TODO! (OR do from inside the object?)
    
    //After all elements added, refresh the view
    [_aaTST2 RefreshList];
    
    /*[JSONParser release], JSONParser = nil;
    id jsonObject = [JSONParser objectWithString:txt error:&error];
    if ([jsonObject isKindOfClass:[NSDictionary class]])
    {
        // treat as a dictionary, or reassign to a dictionary ivar
    }
    else if ([jsonObject isKindOfClass:[NSArray class]])
    {
            // treat as an array or reassign to an array ivar.
    }
    fmTESTOBJ.string = JSONParser.className;*/

    }
    else if (HTTPFuncNum == 3)
    {
        //TEST
[window close];
        NSString *CheckLogin = [[[NSString alloc] initWithData:HTTPResponseData encoding: NSASCIIStringEncoding] autorelease];
[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(HTTPTimerRequest:) userInfo:[[[NSArray alloc] initWithObjects:@"0", @"http://www.facemouth.co.uk/api.php?format=json&type=topic&snum=0&num=10", @"", @"2", @"0", self, nil] autorelease] repeats:NO];
    }
    else if (HTTPFuncNum == 5)
    {
        //TEST - profile view
        /*
            user:
                post:
                    -> user_id
                    -> user_name
                    -> user_email
                    -> images
                    -> user_postcount
                    -> user_profiletext
         */
        NSString *ProfileData = [[[NSString alloc] initWithData:HTTPResponseData encoding: NSASCIIStringEncoding] autorelease];
//        NSLog(@"GOT data; %@", CheckLogin);
/////////////////
        JSONParser = [[SBJsonParser alloc] init];
        id jsonObject = [JSONParser objectWithString:ProfileData];
        if ([jsonObject respondsToSelector:@selector(objectForKey:)])
        {
        NSLog(@"BASH: %d", [[jsonObject objectForKey:@"user"] count]);
            //User exists!
            for (NSDictionary *tweet in [jsonObject objectForKey:@"user"])
            {
                _fmProfilePanel.title = [NSString stringWithFormat:@"%@'s Profile", [[tweet objectForKey:@"post"] objectForKey:@"user_name"]];
                _fmProfilePanelName.stringValue = [[tweet objectForKey:@"post"] objectForKey:@"user_name"];
                _fmProfilePanelDescription.stringValue = [NSString stringWithFormat:@"%@",
/*[[tweet objectForKey:@"post"] objectForKey:@"user_id"],*/
/*[[tweet objectForKey:@"post"] objectForKey:@"user_email"],*/
/*[[tweet objectForKey:@"post"] objectForKey:@"user_postcount"],*/
[[tweet objectForKey:@"post"] objectForKey:@"user_profiletext"]
];
                _fmProfilePanelImage.image = [[[NSImage alloc] initByReferencingURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.facemouth.co.uk/images/%@", [[tweet objectForKey:@"post"] objectForKey:@"images"]]]] autorelease];
            }
            
            if ([[jsonObject objectForKey:@"user"] count] == 0)
            {
                //No such user
                _fmProfilePanel.title = @"No Such Profile!";
                _fmProfilePanelName.stringValue = @"Invalid User";
                _fmProfilePanelDescription.stringValue = @"Unfortunately, the specified user does not exist on Facemouth.";
                _fmProfilePanelImage.image = [NSImage imageNamed:@"mrs-brown-lol.jpg"];
            }
        }
        else
        {
            //No such user
            _fmProfilePanel.title = @"No Such Profile!";
            _fmProfilePanelName.stringValue = @"Invalid User";
            _fmProfilePanelDescription.stringValue = @"Unfortunately, the specified user does not exist on Facemouth.";
            _fmProfilePanelImage.image = [NSImage imageNamed:@"mrs-brown-lol.jpg"];
        }
        [JSONParser release];
/////////////////
        [_fmProfilePanel makeKeyAndOrderFront:_fmProfilePanel];
    }
    else if (HTTPFuncNum == 6 && 1 == 2)
    {
        //Profile data
        NSString *ProfileData = [[[NSString alloc] initWithData:HTTPResponseData encoding: NSASCIIStringEncoding] autorelease];
        JSONParser = [[SBJsonParser alloc] init];
        id jsonObject = [JSONParser objectWithString:ProfileData];
        if ([jsonObject respondsToSelector:@selector(objectForKey:)])
        {
            //User exists!
            for (NSDictionary *tweet in [jsonObject objectForKey:@"user"])
            {
                [_aaTST2 ChangePicture:[[PicsToGet objectAtIndex:LoopCounter] intValue] withPicture:[[tweet objectForKey:@"post"] objectForKey:@"images"]];
            }
        }

        //Run next loop!
        ++LoopCounter;
        
        if (LoopCounter < [PicsToGet count])
        {
[NSTimer scheduledTimerWithTimeInterval:0 target:self selector:@selector(HTTPTimerRequest:) userInfo:[[[NSArray alloc] initWithObjects:@"0", [NSString stringWithFormat:@"http://www.facemouth.co.uk/api.php?format=json&type=userid&idnum=%d", [[PicsToGet objectAtIndex:LoopCounter] intValue]], @"", @"6", @"0", self, nil] autorelease] repeats:NO];
        }
//todo
    }
//    [responseData release];
//    [responseURL release];
    UpdateCookies = false;
    [HTTPResponseData release];
    [HTTPConnection release];
    [HTTPURLRequest release];
}

/*
 + sendSynchronousRequest:returningResponse:error:
 
 Loading Data Asynchronously
 
 + connectionWithRequest:delegate:
 – initWithRequest:delegate:
 – initWithRequest:delegate:startImmediately:
 – start
 
 Check the NSURLConnection class in Apple Developer API Reference.
 */

- (IBAction)btnLoginClicked:(id)sender
{
    if (fmUser.stringValue.length < 2 || fmUser.stringValue.length > 14)
    {
        //Invalid Username

    }
    else if (fmPass.stringValue.length < 4 || fmPass.stringValue.length > 32)
    {
        //Invalid Password
//        [_aaTST1 insertRowsAtIndexes:<#(NSIndexSet *)#>]
    }
    else
    {
        //No errors; perform login
        [fmUser setEditable:NO];
        [fmPass setEditable:NO];
        [fmUser setEnabled:NO];
        [fmPass setEnabled:NO];
        [fmLoginBtn setEnabled:NO];
        [_fmSignUpBtn setEnabled:NO];
        UpdateCookies = true;
        //[fmViewController setView:fmTestView];
        //fmViewController.loadView;
//        [fmViewController.view removeFromSuperview];
//        fmViewController.view = [[fmTestView alloc] initWithRootElement:self];
//        [fmViewController.view addSubview:fmViewController.view];
//        [fmViewController.view release];
//        [[fmViewController view] setFrame:[fmTestView bounds]];
//        [fmTestView init];
//        [fmBSWIN display];
/*        NSWindowController* yourWindowController = [[NSWindowController alloc] initWithWindowNibName:@"MainMenu"];
        [yourWindowController showWindow:self];*/
//        [windowcnt showWindow:fmBSWIN];
//                [fmBSWIN display];
//        [window makeKeyAndOrderFront:fmBSWIN];
        
//        fmTESTOBJ.string = @"Lol";
//        [DoHTTPRequest];
//        DoHTTPRequest();

        //        NSString *post = @"key1=val1&key2=val2";
//        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
//        NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
        
//        [self HTTPRequest:FALSE withURL:@"http://www.facemouth.co.uk/api.php?format=json&type=topic&snum=0&num=10" withPOSTData:nil withFuncNum:1];
        [self HTTPRequest:TRUE withURL:@"http://www.facemouth.co.uk/signin.php" withPOSTData:[NSString stringWithFormat:@"user_name=%@&user_pass=%@", [self HTTPURLEncode:fmUser.stringValue], [self HTTPURLEncode:fmPass.stringValue]] withFuncNum:1 withCookies:1];
        
/*        NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
        [request setURL:[NSURL URLWithString:@"http://www.facemouth.co.uk/api.php?format=json&type=topic&snum=0&num=10"]];
        [request setHTTPMethod:@"GET"];
        [request setCachePolicy:NSURLRequestUseProtocolCachePolicy];
//        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
//        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        //    [[NSURLConnection alloc] initWithRequest:request delegate:self];
        NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:request delegate:self];*/
//        [request setHTTPBody:postData];
    }
}

- (IBAction)btnSignUpClicked:(id)sender
{
    //Open the sign-up page!
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"http://www.facemouth.co.uk/signup.php"]];
}

-(void)controlTextDidEndEditing:(NSNotification *)obj
{
//    if ([[obj userInfo] value] == [fmUser value])
//    {
//        NSTextField* textField = (NSTextField *)[obj object];
//    NSLog(@"%@", [(NSTextField *)[obj object] identifier]);
    if ([[(NSTextField *)[obj object] identifier] isEqual: @"fmUser"] || [[(NSTextField *)[obj object] identifier] isEqual: @"fmPass"])
    {
//TODO!!!!
//    NSLog([obj object]);
        if ( [[[obj userInfo] objectForKey:@"NSTextMovement"] intValue] == NSReturnTextMovement )
        {
            [self btnLoginClicked:nil];
        }
    }
//    [textField release];
}

- (void)HTTPRequest:(BOOL)RequestType withURL:(NSString *)RequestURL withPOSTData:(NSString *)RequestPOSTData withFuncNum:(int)FuncNum withCookies:(bool)SendCookies
{
    HTTPURLRequest = [[NSMutableURLRequest alloc] init];
    [HTTPURLRequest setHTTPShouldHandleCookies:NO];
    [HTTPURLRequest setURL:[NSURL URLWithString:RequestURL]];
    [HTTPURLRequest setCachePolicy:NSURLRequestUseProtocolCachePolicy];
    if (RequestType == true)
    {
        //POST request, add POST data
        //TODO! Do escaping? Add extra function?
        NSData *postData = [RequestPOSTData dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        [HTTPURLRequest setHTTPMethod:@"POST"];
        [HTTPURLRequest setValue:[NSString stringWithFormat:@"%ld", (unsigned long)[postData length]] forHTTPHeaderField:@"Content-Length"];
        [HTTPURLRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [HTTPURLRequest setHTTPBody:postData];
    }
    else
    {
        //GET reqest
        [HTTPURLRequest setHTTPMethod:@"GET"];
    }
    
    //Include cookies?
    if (SendCookies == true)
    {
        //Yes!
//FacemouthCookies = @"TESTER";
NSLog(@"A CRASH %@", FacemouthCookies);
        [HTTPURLRequest setValue:[NSString stringWithFormat:@"%@", FacemouthCookies] forHTTPHeaderField:@"Cookie"];
    }
    else
    {
        //No.
        [HTTPURLRequest setValue:@"" forHTTPHeaderField:@"Cookie"];
    }
    
    //Setup the callback function memory
    //    CallbackFunction = x;
    HTTPFuncNum = FuncNum;
    
    //Start animation
//    if (FuncNum == 1)
//    {
        //Login forum
        [fmLoginSpn startAnimation:0];
//    }
    
    //Fire off the HTTP request
    HTTPConnection = [[NSURLConnection alloc] initWithRequest:HTTPURLRequest delegate:self];
}

- (void)HTTPTimerRequest:(NSTimer *)timer
{
        [self HTTPRequest:[[[timer userInfo] objectAtIndex:0] intValue] withURL:[[timer userInfo] objectAtIndex:1] withPOSTData:[[timer userInfo] objectAtIndex:2] withFuncNum:[[[timer userInfo] objectAtIndex:3] intValue] withCookies:(bool)[[[timer userInfo] objectAtIndex:4] intValue]];
}

- (NSString*)HTTPURLEncode:(NSString*)OriginalData
{
    /* Encodes data safely to be transmitted over HTTP */
    return [(NSString *)CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)OriginalData, NULL, (CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8) autorelease];
}

- (IBAction)btnProfileClicked:(id)sender
{
    //TEST function to get a profile
    [self HTTPRequest:false withURL:[NSString stringWithFormat:@"http://www.facemouth.co.uk/api.php?format=json&type=userid&idnum=%d", [[_fmProfileID stringValue] intValue]] withPOSTData:nil withFuncNum:5 withCookies:0];
}

- (void)PostReply
{
    //Posts a reply to a thread
[NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(HTTPTimerRequest:) userInfo:[[[NSArray alloc] initWithObjects:@"1", @"http://www.facemouth.co.uk/reply.php?id=1008791", [NSString stringWithFormat:@"reply-content=%@", [self HTTPURLEncode:@"TEST - IGNORE.\r\n\r\n-----\r\nPosted using Facemouth for Mac."]], @"9", @"1", self, nil] autorelease] repeats:NO];
}

- (int)PostTopic
{
    //Posts a new topic and returns the topic ID
[NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(HTTPTimerRequest:) userInfo:[[[NSArray alloc] initWithObjects:@"1", @"http://www.facemouth.co.uk/add.php", [NSString stringWithFormat:@"topic_subject=%@&post_content=%@", [self HTTPURLEncode:@"Nice day.\r\n8-)"], [self HTTPURLEncode:@"Go outside and enjoy the fresh air ;).\r\n\r\n-----\r\nPosted using Facemouth for Mac."]], @"9", @"1", self, nil] autorelease] repeats:NO];
/*
 <META http-equiv="REFRESH" content="0; url=http://www.facemouth.co.uk">You have succesfully created <a href="topic.php?id=1008792">your new topic</a>.
 */
    
    return 0;
}

@end
