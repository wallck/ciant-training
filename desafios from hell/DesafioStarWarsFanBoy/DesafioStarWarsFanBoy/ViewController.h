//
//  ViewController.h
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 16/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) NSManagedObjectContext *context;
@property (weak, nonatomic) AppDelegate *appDelegate;

- (void)saveContext;

@end

