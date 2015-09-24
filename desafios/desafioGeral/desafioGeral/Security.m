//
//  Security.m
//  desafioGeral
//
//  Created by Wallace Goncalves de Oliveira on 02/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Security.h"

@implementation Security

static BOOL _authenticated;
+(BOOL)authenticated {
    return _authenticated;
}
+(void)setAuthenticated:(BOOL)authenticated {
    _authenticated = authenticated;
}

+(void)doLoginWithUser:(User *)user {
    NSData *data = [Security callURL:[Security urlToValidateLogin: user]];
    Security.authenticated = data.length > 0;
}

#pragma Privados

+(NSData*)callURL:(NSString*)url {
    NSURL *u = [NSURL URLWithString:url];
    NSData *data = [NSData dataWithContentsOfURL:u];
    return data;
}
+(NSString*)urlToValidateLogin:(User *)user {
    return [NSString stringWithFormat:LOGIN_URL, user.userName, user.password, SYSTEM_USER_NAME, SYSTEM_PASSWORD];
}

@end
