//
//  ThreadController.h
//  Facemouth
//
//  Created by thedjnK on 24/03/2013.
//  Version 0.1, Updated 27/03/2013.
//
//

#import <Foundation/Foundation.h>

@interface ThreadController : NSObject <NSTableViewDataSource>
{
//@private
    IBOutlet NSTableView *ThreadListView;
    NSMutableArray *ThreadData;
}

- (IBAction)add:(id)sender;
//- (void)setCollection:(NSString *)DataA;
//- (void)setCollection:(NSString *)DataA withAge:(int)DataB;
//- (void)setCollection:(NSString *)DataA withAge:(NSString *)DataB;
- (void)AddThreadToList:(int)TopicID withPosts:(int)TopicPosts withCat:(int)TopicCat withUserID:(int)TopicUserID withTitle:(NSString *)TopicTitle withUser:(NSString *)TopicUser withDate:(NSDate *)TopicCreated;
- (void)RemoveThreadFromList; //TODO: Remove one of the array elements
- (void)FilterUserFromList; //TODO: Filter out a username from any lists
- (void)RefreshList;
- (void)ClearList;
- (void)ChangePicture:(int)UserID withPicture:(NSString *)Picture;
@end