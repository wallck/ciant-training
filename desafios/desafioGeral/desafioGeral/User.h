//
//  Usuario.h
//  desafioGeral
//
//  Created by Wallace Goncalves de Oliveira on 02/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface User : NSObject

@property NSString *userName;
@property NSString *password;
@property UIImage *picture;
@property (readonly) NSMutableArray *tasks;

+(instancetype)newWithUserName:(NSString*)userName password:(NSString*)password;
+(instancetype)newWithUserName:(NSString*)userName password:(NSString*)password andPicture:(UIImage*)picture;

@end
