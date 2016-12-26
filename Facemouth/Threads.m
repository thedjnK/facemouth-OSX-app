//
//  Threads.m
//  Facemouth
//
//  Created by thedjnK on 24/03/2013.
//  Version 0.1, Updated 27/03/2013.
//
//

#import "Threads.h"

@implementation Threads

@synthesize TopicID;
@synthesize TopicPosts;
@synthesize TopicCat;
@synthesize TopicUserID;
@synthesize TopicTitle;
@synthesize TopicUser;
@synthesize TopicCreated;
@synthesize SomeImg;

- (id)init
{
    self = [super init];
    if (self)
    {
        //Initialisation
        TopicID = 0;
        TopicPosts = 0;
        TopicCat = 0;
        TopicUserID = 0;
        TopicTitle = @"";
        TopicUser = @"";
        TopicCreated = [NSDate distantPast];
        SomeImg = [NSImage imageNamed:@"mrs-brown-lol.jpg"];
        TESTAB = @"";
    }
    return self;
}

- (void)dealloc
{
    [TopicTitle release];
    [TopicUser release];
    [TopicCreated release];
    [super dealloc];
}

@end
