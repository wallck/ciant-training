//
//  Employee.h
//  iCracha
//
//  Created by Wallace Goncalves de Oliveira on 25/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "Person.h"

@interface Employee : Person

@property NSString *workPlace;
@property NSNumber *salary;
@property NSString *biography;
@property (readonly) NSMutableArray *badges;

+(instancetype)newWithName:(NSString*)name workPlace:(NSString*)workPlace salary:(NSNumber*)salary biography:(NSString*)biography;

-(void)addBadge:(NSString*)name andStoredImageName:(NSString*)storedImageName;
-(void)setPictureByStoredImageName:(NSString *)storedImageName;

@end