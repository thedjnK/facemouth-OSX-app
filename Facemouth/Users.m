//
//  Users.m
//  Facemouth
//
//  Created by thedjnK on 24/03/2013.
//  Version 0.1, Updated 27/03/2013.
//
//

#import "Users.h"

@implementation Users

@synthesize ID;
@synthesize PostCount;
@synthesize LastUpdated;
@synthesize Name;
@synthesize ProfileText;
@synthesize Image;

- (id)init
{
    self = [super init];
    if (self)
    {
        //Initialisation
ID = 0; //REMOVE!
        PostCount = 0;
        LastUpdated = 0;
        Name = @"";
        ProfileText = @"";
        Image = [NSImage imageNamed:@"mrs-brown-lol.jpg"];;
    }
    return self;
}

- (void)dealloc
{
    [Name release];
    [ProfileText release];
    [Image release];
    [super dealloc];
}

@end
