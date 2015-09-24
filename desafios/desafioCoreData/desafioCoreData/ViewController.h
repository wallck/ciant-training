//
//  ViewController.h
//  desafioCoreData
//
//  Created by Wallace Goncalves de Oliveira on 11/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Client.h"
#import "Order.h"
#import "OrderItem.h"
#import "Product.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) NSManagedObjectContext *context;
@property (weak, nonatomic) AppDelegate *appDelegate;

- (void)saveContext;

@end

