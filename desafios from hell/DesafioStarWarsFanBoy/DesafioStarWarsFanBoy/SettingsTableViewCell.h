//
//  SettingsTableViewCell.h
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 18/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsTableViewCell : UITableViewCell

@property NSMutableArray *fields;
@property NSString *fieldName;
@property NSUserDefaults *userDefaults;
@property NSString *settingsID;
@property UITableView *tableView;

@property (weak, nonatomic) IBOutlet UILabel *fieldNameLabel;
@property (weak, nonatomic) IBOutlet UISwitch *fieldSwitch;

@end
