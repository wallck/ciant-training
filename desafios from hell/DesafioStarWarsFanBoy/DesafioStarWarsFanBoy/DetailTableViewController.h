//
//  DetailTableViewController.h
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 18/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseNSManagedObject.h"

@interface DetailTableViewController : UITableViewController

@property BaseNSManagedObject *instance;
@property NSString *settingsID;

@end
