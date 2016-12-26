//
//  ThreadController.m
//  Facemouth
//
//  Created by thedjnK on 24/03/2013.
//  Version 0.1, Updated 27/03/2013.
//
//

#import "ThreadController.h"
#import "Threads.h"

@implementation ThreadController

- (id)init
{
    self = [super init];
    if (self)
    {
        //Initialisation
        ThreadData = [[NSMutableArray alloc] init];
    }
    return self;
}

- (IBAction)add:(id)sender
{
    //Creates a new blank item and refreshes the view
    [ThreadData addObject:[[Threads alloc] init]];
    [ThreadListView reloadData];
}

/* EXTERNAL FUNCTIONS */

- (void)AddThreadToList:(int)TopicID withPosts:(int)TopicPosts withCat:(int)TopicCat withUserID:(int)TopicUserID withTitle:(NSString *)TopicTitle withUser:(NSString *)TopicUser withDate:(NSDate *)TopicCreated
{
    //Adds a thread to the dictionary and refreshes the list
    [ThreadData addObject:[[Threads alloc] init]];
    [[ThreadData objectAtIndex:([ThreadData count]-1)] setTopicID:TopicID];
    [[ThreadData objectAtIndex:([ThreadData count]-1)] setTopicPosts:TopicPosts];
    [[ThreadData objectAtIndex:([ThreadData count]-1)] setTopicCat:TopicCat];
    [[ThreadData objectAtIndex:([ThreadData count]-1)] setTopicUserID:TopicUserID];
    [[ThreadData objectAtIndex:([ThreadData count]-1)] setTopicTitle:TopicTitle];
    [[ThreadData objectAtIndex:([ThreadData count]-1)] setTopicUser:TopicUser];
    [[ThreadData objectAtIndex:([ThreadData count]-1)] setTopicCreated:TopicCreated];
    [[ThreadData objectAtIndex:([ThreadData count]-1)] setTESTAB:[NSDateFormatter localizedStringFromDate:TopicCreated dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle]];
}

- (void)RemoveThreadFromList
{
    //Removes a thread from the list and refreshes the view
}

- (void)FilterUserFromList
{
    //Filters out a username from any elements in the view and refreshes the view
}

- (void)RefreshList
{
    //Refreshes list
    [ThreadListView reloadData];
}

- (void)ClearList
{
    //Clears list and refreshes list
    [ThreadData removeAllObjects];
    [ThreadListView reloadData];
}

/* FUNCTIONS FOR LIST VIEW OBJECT */

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    //Returns number of items in thread list
    return [ThreadData count];
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    //Returns an item for specified row
    Threads *p = [ThreadData objectAtIndex:row];
    NSString *identifier = [tableColumn identifier];
    return [p valueForKey:identifier];
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
