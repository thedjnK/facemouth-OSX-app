//
//  FacemouthAppDelegate.h
//  Facemouth
//
//  Created by thedjnK on 18/03/2013.
//  Version 0.1, Updated 27/03/2013.
//  Copyright 2013 Failparty. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SBJson.h" //JSON Handler
#import "RegexKitLite.h" //Regex Handler
#import "ThreadController.h" //TableView controller for threads
#import "UserController.h" //Controller for users

//NSMutableData *responseData;
//NSURL *responseURL;
SBJsonParser *JSONParser;

/* HTTP Controller */
NSMutableURLRequest *HTTPURLRequest;
NSURLConnection *HTTPConnection;
//NSString *CallbackFunction;
NSString *HTTPURL;
NSString *HTTPRedirectURL;
NSMutableData *HTTPResponseData;
unsigned int HTTPFuncNum;
bool UpdateCookies; //TRUE for allow cookie updates with this request

/* Facemouth stuff */
NSString *FacemouthUsername; //The username of the logged in user
int FacemouthUserID; //The ID of the logged in user
NSString *FacemouthCookies; //Holds the cookies of the user
unsigned int fmSessionUpdated; //When the session was last 'kept-alive'
int FacemouthLastPostTime; //Timestamp of last post, to avoid allowing spamming and double posting

//TESTING!
NSMutableArray *PicsToGet;
int LoopCounter;

@interface FacemouthAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
    NSTextField *fmUser;
    NSSecureTextField *fmPass;
    NSButton *fmLoginBtn;
    __unsafe_unretained NSButton *_fmSignUpBtn;
    NSProgressIndicator *fmLoginSpn;
    NSViewController *fmViewController;
    NSView *fmTestView;
    NSView *fmNormalView;
    NSWindow *fmBSWIN;
    NSTextView *fmTESTOBJ;
    NSWindow *fmThreadWindow;
    NSTextField *fmThreadTest;
    NSWindowController *windcnt;
    
    __unsafe_unretained NSTextField *_fmLoginStatus;

    __unsafe_unretained ThreadController *_aaTST2;
    
    //Profile input/button
    __unsafe_unretained NSTextField *_fmProfileID;
    
    //Profile panel stuff
    __unsafe_unretained NSPanel *_fmProfilePanel;
    __unsafe_unretained NSTextField *_fmProfilePanelName;
    __unsafe_unretained NSTextField *_fmProfilePanelDescription;
    __unsafe_unretained NSButton *_fmProfilePanelCloseBtn;
    __unsafe_unretained NSImageView *_fmProfilePanelImage;
}

- (IBAction)btnLoginClicked:(id)sender;
- (IBAction)btnSignUpClicked:(id)sender;

@property (assign) IBOutlet NSWindowController *windcnt;

@property (assign) IBOutlet NSWindow *window;

@property (assign) IBOutlet NSTextField *fmUser;

@property (assign) IBOutlet NSSecureTextField *fmPass;

@property (assign) IBOutlet NSButton *fmLoginBtn;

@property (assign) IBOutlet NSProgressIndicator *fmLoginSpn;

@property (assign) IBOutlet NSViewController *fmViewController;

@property (assign) IBOutlet NSView *fmTestView;

@property (assign) IBOutlet NSView *fmNormalView;
@property (assign) IBOutlet NSWindow *fmBSWIN;
@property (assign) IBOutlet NSTextView *fmTESTOBJ;

@property (assign) IBOutlet NSWindow *fmThreadWindow;
@property (assign) IBOutlet NSTextField *fmThreadTest;

@property (unsafe_unretained) IBOutlet ThreadController *aaTST2;

- (void)HTTPRequest:(BOOL)RequestType withURL:(NSString *)RequestURL withPOSTData:(NSString *)RequestPOSTData withFuncNum:(int)FuncNum withCookies:(bool)SendCookies;
- (void)HTTPTimerRequest:(NSTimer *)timer;
- (NSString*)HTTPURLEncode:(NSString*)OriginalData;
- (IBAction)btnProfileClicked:(id)sender;

@property (unsafe_unretained) IBOutlet NSTextField *fmLoginStatus;
@property (unsafe_unretained) IBOutlet NSTextField *fmProfileID;
@property (unsafe_unretained) IBOutlet NSPanel *fmProfilePanel;
@property (unsafe_unretained) IBOutlet NSTextField *fmProfilePanelName;
@property (unsafe_unretained) IBOutlet NSTextField *fmProfilePanelDescription;
@property (unsafe_unretained) IBOutlet NSButton *fmProfilePanelCloseBtn;
@property (unsafe_unretained) IBOutlet NSImageView *fmProfilePanelImage;
@property (unsafe_unretained) IBOutlet NSButton *fmSignUpBtn;
@end
