//
//  Threads.h
//  Facemouth
//
//  Created by thedjnK on 24/03/2013.
//  Version 0.1, Updated 27/03/2013.
//
//

#import <Foundation/Foundation.h>

@interface Threads : NSObject
{
//    @private
    int TopicID;
    int TopicPosts;
    int TopicCat;
    int TopicUserID;
    NSString *TopicTitle;
    NSString *TopicUser;
    NSString *TESTAB;
    NSDate *TopicCreated;
    
    NSImage *SomeImg;
}

@property int TopicID;
@property int TopicPosts;
@property int TopicCat;
@property int TopicUserID;
@property (copy) NSString *TopicTitle;
@property (copy) NSString *TopicUser;
@property (copy) NSDate *TopicCreated;
@property (copy) NSString *TESTAB;
@property (copy) NSImage *SomeImg;

@end
