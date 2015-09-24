//
//  Usuario.m
//  desafioGeral
//
//  Created by Wallace Goncalves de Oliveira on 02/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "User.h"
#import "Task.h"

@implementation User

+(instancetype)newWithUserName:(NSString *)userName password:(NSString *)password {
    return [User newWithUserName:userName password:password andPicture:nil];
}

+(instancetype)newWithUserName:(NSString *)userName password:(NSString *)password andPicture:(UIImage *)picture {
    return [[User alloc] initWithUserName:userName password:password andPicture:picture];
}

-(instancetype)init {
    return [self initWithUserName:@"" password:@"" andPicture:nil];
}

-(instancetype)initWithUserName:(NSString*)userName password:(NSString*)password andPicture:(UIImage*)picture {
    self = [super init];
    
    if (self) {
        _userName = userName;
        _password = password;
        _picture = picture;
        
        _tasks = [NSMutableArray array];
        [_tasks addObject: [Task newWithName:@"Jogar Starcraft II"]];
        [_tasks addObject: [Task newWithName:@"Assistir Narcos no Netflix"]];
        [_tasks addObject: [Task newWithName:@"Ir para a CI&T"]];
    }
    
    return self;
}

@end
