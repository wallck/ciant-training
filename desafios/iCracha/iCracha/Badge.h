//
//  Badge.h
//  iCracha
//
//  Created by Wallace Goncalves de Oliveira on 25/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define BADGE_FIRST_CHALLENGE @"badge1"
#define BADGE_SECOND_CHALLENGE @"badge2"
#define BADGE_THIRD_CHALLENGE @"badge3"
#define BADGE_FOURTH_CHALLENGE @"badge4"
#define BADGE_CHAMPION_CHALLENGE @"badge5"
#define BADGE_PONCTUAL @"badge6"
#define BADGE_GOOD_DRIVER @"badge7"
#define BADGE_PHOTOGENIC @"badge8"
#define BADGE_BLIND_GUY @"badge9"
#define BADGE_BEST_EMPLOYEE @"badge10"

@interface Badge : NSObject

@property NSString *name;
@property UIImage *picture;

+(instancetype)newWithName:(NSString*)name andPicture:(UIImage*)picture;

@end
