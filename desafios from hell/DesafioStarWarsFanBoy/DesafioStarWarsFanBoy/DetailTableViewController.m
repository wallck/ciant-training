//
//  DetailTableViewController.m
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 18/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "DetailTableViewController.h"
#import "DetailTableViewCell.h"

#define CELL_ID @"detailCellId"

@interface DetailTableViewController () {
    NSUserDefaults *_userDefaults;
    NSMutableArray *_userDefaultFields;
}

@end

@implementation DetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    _userDefaults = [NSUserDefaults standardUserDefaults];
    _userDefaultFields = [_userDefaults objectForKey:_settingsID];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _userDefaultFields.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];
    
    NSString *fieldName = _userDefaultFields[indexPath.item];
    id value = [_instance getPropertyValue:fieldName];
    
    cell.fieldLabel.text = [NSString stringWithFormat:@"%@:", fieldName];
    cell.fieldDetailLabel.text = [NSString stringWithFormat:@"%@", value];
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
