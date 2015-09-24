//
//  Security.h
//  desafioGeral
//
//  Created by Wallace Goncalves de Oliveira on 02/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

#define SYSTEM_USER_NAME @"admin"
#define SYSTEM_PASSWORD @"masterkey"
#define LOGIN_URL @"http://%@:%@@httpbin.org/basic-auth/%@/%@"

@interface Security : NSObject

+(BOOL)authenticated;
+(void)setAuthenticated:(BOOL)authenticated;

+(void)doLoginWithUser:(User*)user;

@end
