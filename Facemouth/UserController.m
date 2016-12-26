//
//  UserController.m
//  Facemouth
//
//  Created by thedjnK on 24/03/2013.
//  Version 0.1, Updated 27/03/2013.
//
//

#import "UserController.h"
#import "Users.h"

@implementation UserController

- (id)init
{
    self = [super init];
    if (self)
    {
        //Initialisation
        UserData = [[NSMutableArray alloc] init];
    }
    return self;
}

- (IBAction)add:(id)sender
{
    //Creates a new blank item and refreshes the view
    [UserData addObject:[[Users alloc] init]];
}

/* EXTERNAL FUNCTIONS */

- (void)AddThreadToList:(int)TopicID withPosts:(int)TopicPosts withCat:(int)TopicCat withUserID:(int)TopicUserID withTitle:(NSString *)TopicTitle withUser:(NSString *)TopicUser withDate:(NSDate *)TopicCreated
{
    //Adds a thread to the dictionary and refreshes the list
/*    [UserData addObject:[[Users alloc] init]];
    [[UserData objectAtIndex:([UserData count]-1)] setTopicID:TopicID];
    [[UserData objectAtIndex:([UserData count]-1)] setTopicPosts:TopicPosts];
    [[UserData objectAtIndex:([UserData count]-1)] setTopicCat:TopicCat];
    [[UserData objectAtIndex:([UserData count]-1)] setTopicUserID:TopicUserID];
    [[UserData objectAtIndex:([UserData count]-1)] setTopicTitle:TopicTitle];
    [[UserData objectAtIndex:([UserData count]-1)] setTopicUser:TopicUser];
    [[UserData objectAtIndex:([UserData count]-1)] setTopicCreated:TopicCreated];
    [[UserData objectAtIndex:([UserData count]-1)] setTESTAB:[NSDateFormatter localizedStringFromDate:TopicCreated dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle]];*/
}

- (void)ClearList
{
    //Clears list and refreshes list
    [UserData removeAllObjects];
}

- (void)ChangePicture:(int)UserID withPicture:(NSString *)Picture;
{
    //Changes picture
    NSLog(@"CHANGE[%d]TO[%@]", UserID, Picture);
}

- (void)dealloc
{
    [super dealloc];
}

@end
