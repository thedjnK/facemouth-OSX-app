//
//  Users.h
//  Facemouth
//
//  Created by thedjnK on 24/03/2013.
//  Version 0.1, Updated 27/03/2013.
//
//

#import <Foundation/Foundation.h>

@interface Users : NSObject
{
int ID; //REMOVE!
    int PostCount;
    int LastUpdated;
    NSString *Name;
    NSString *ProfileText;
    NSImage *Image;
}

@property int ID; //REMOVE!
@property int PostCount;
@property int LastUpdated;
@property (copy) NSString *Name;
@property (copy) NSString *ProfileText;
@property (copy) NSImage *Image;

@end
