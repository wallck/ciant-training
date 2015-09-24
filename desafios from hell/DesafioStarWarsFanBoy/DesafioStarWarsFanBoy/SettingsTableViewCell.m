//
//  SettingsTableViewCell.m
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 18/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "SettingsTableViewCell.h"

@implementation SettingsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)changeFieldVisibility:(UISwitch *)sender {
    if (![_fieldSwitch isOn] && [_fields containsObject:_fieldName])
        [_fields removeObject:_fieldName];
    else if (![_fields containsObject:_fieldName])
        [_fields addObject:_fieldName];
    
    [_userDefaults setObject:_fields forKey:_settingsID];
    [_userDefaults synchronize];
    [_tableView reloadData];
}

@end
