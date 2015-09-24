//
//  MenuTableViewController.m
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 17/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "MenuTableViewController.h"
#import "EntityTableViewController.h"
#import "BaseNSManagedObject.h"
#import "JsonHelper.h"

#define CELL_ID @"menuCellId"

@interface MenuTableViewController () {
    NSDictionary *_menu;
}

@end

@implementation MenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _menu = [JsonHelper getJSONDictionary:[BaseNSManagedObject URL_API]];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _menu.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];
    
    cell.textLabel.text = [_menu.allKeys[indexPath.item] uppercaseString];
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    EntityTableViewController *vc = (EntityTableViewController *)segue.destinationViewController;
    NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
    
    vc.title = _menu.allKeys[indexPath.item];
    vc.entityName = _menu.allKeys[indexPath.item];
    vc.context = _context;
}

@end
