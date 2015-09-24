//
//  SettingsTableViewController.m
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 18/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "SettingsTableViewController.h"
#import "SettingsTableViewCell.h"

#define CELL_ID @"settingsCellId"
#define SETTINGS_ID @"%@SettingsId"

@interface SettingsTableViewController () {

}

@end

@implementation SettingsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _settingsID = [NSString stringWithFormat:SETTINGS_ID, _entityName];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _allFields.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SettingsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];
    
    NSString *fieldName = _allFields[indexPath.item];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *userDefaultFields = [userDefaults objectForKey:_settingsID];
    
    cell.fieldNameLabel.text = fieldName;
    cell.fieldName = fieldName;
    cell.fieldSwitch.on = [userDefaultFields containsObject:fieldName];
    cell.fields = [[NSMutableArray alloc] initWithArray:userDefaultFields];
    cell.settingsID = _settingsID;
    cell.tableView = tableView;
    cell.userDefaults = userDefaults;
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

@end
