//
//  EntityTableViewController.h
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 17/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EntityTableViewController : UITableViewController

@property NSString *entityName;
@property NSManagedObjectContext *context;

@end
