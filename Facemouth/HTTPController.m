//
//  ThreadController.m
//  Facemouth
//
//  Created by thedjnK on 24/03/2013.
//  Version 0.1, Updated 27/03/2013.
//
//

/*#import "HTTPController.h"

@implementation HTTPController

- (id)init
{
    self = [super init];
    if (self)
    {
        //Initialisation
        HTTPURLRequest = [[NSMutableURLRequest alloc] init];
        CallbackFunction = [[NSString alloc] init];
        HTTPURL = [[NSString alloc] init];
        HTTPRedirectURL = [[NSString alloc] init];
    }
    return self;
}

- (void)DoHTTPRequest:(BOOL)RequestType:(NSString *)RequestURL
{
    [HTTPURLRequest setURL:[NSURL URLWithString:RequestURL]];
    [HTTPURLRequest setCachePolicy:NSURLRequestUseProtocolCachePolicy];
    if (RequestType == true)
    {
        //POST request, add POST data
        NSString *post = @"key1=val1&key2=val2";
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
        [HTTPURLRequest setHTTPMethod:@"POST"];
        [HTTPURLRequest setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [HTTPURLRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [HTTPURLRequest setHTTPBody:postData];
    }
    else
    {
        //GET reqest
        [HTTPURLRequest setHTTPMethod:@"GET"];
    }
    
    //Setup the callback function memory
//    CallbackFunction = x;
    
    //Fire off the HTTP request
    HTTPConnection = [[NSURLConnection alloc] initWithRequest:HTTPURLRequest delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    /*
     * /
    HTTPResponseData = [[NSMutableData alloc] init];
//    responseURL = [[NSURL alloc] init];
//    responseURL = [response URL];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    /*
     * /
    [HTTPResponseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    /*
     * /
    [HTTPResponseData release];
    [HTTPConnection release];
    
    //Do a callback here with the error
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //Do a callback here with the data!
}

- (void)dealloc
{
    [HTTPURLRequest release];
    [CallbackFunction release];
    [HTTPURL release];
    [HTTPRedirectURL release];
    [super dealloc];
}

@end*/
