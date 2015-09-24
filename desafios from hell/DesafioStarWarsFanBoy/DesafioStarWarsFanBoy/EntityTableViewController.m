//
//  EntityTableViewController.m
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 17/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "EntityTableViewController.h"
#import "SettingsTableViewController.h"
#import "DetailTableViewController.h"
#import "AlertBox.h"
#import "JsonHelper.h"
#import "BaseNSManagedObject.h"
#import "CoreDataFilmController.h"
#import "CoreDataPeopleController.h"
#import "CoreDataPlanetController.h"
#import "CoreDataVehicleController.h"
#import "CoreDataStarshipController.h"
#import "CoreDataSpecieController.h"

#define CELL_ID @"entityCellId"
#define SETTINGS_ID @"%@SettingsId"

@interface EntityTableViewController () {
    NSArray<BaseNSManagedObject *> *_entities;
    NSMutableArray *_allFields;
    AlertBox *_alert;
}

@end

@implementation EntityTableViewController

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _alert = [AlertBox newWithViewController:self];
    
    if ([_entityName isEqualToString:@"films"])
        _entities = [CoreDataFilmController loadByContext:_context];
    else if ([_entityName isEqualToString:@"people"])
        _entities = [CoreDataPeopleController loadByContext:_context];
    else if ([_entityName isEqualToString:@"planets"])
        _entities = [CoreDataPlanetController loadByContext:_context];
    else if ([_entityName isEqualToString:@"vehicles"])
        _entities = [CoreDataVehicleController loadByContext:_context];
    else if ([_entityName isEqualToString:@"starships"])
        _entities = [CoreDataStarshipController loadByContext:_context];
    else if ([_entityName isEqualToString:@"species"])
        _entities = [CoreDataSpecieController loadByContext:_context];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _entities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];
    
    cell.textLabel.text = _entities[indexPath.item].displayName;
    
    cell.detailTextLabel.text = @"";
    if (_entities[indexPath.item].lastSeen) {
        NSString *dateText = [JsonHelper convertDate:_entities[indexPath.item].lastSeen toFormatString:@"dd/MM/yyyy"];
        dateText = [NSString stringWithFormat:@"Seen at %@", dateText];
        cell.detailTextLabel.text = dateText;
    }
    
    return cell;
}


#pragma mark - Navigation

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    NSString *settingsID = [NSString stringWithFormat:SETTINGS_ID, _entityName];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *fields = [userDefaults objectForKey:settingsID];
    
    if ([_entityName isEqualToString:@"films"])
        _allFields = [Film allFields];
    else if ([_entityName isEqualToString:@"people"])
        _allFields = [People allFields];
    else if ([_entityName isEqualToString:@"planets"])
        _allFields = [Planet allFields];
    else if ([_entityName isEqualToString:@"vehicles"])
        _allFields = [Vehicle allFields];
    else if ([_entityName isEqualToString:@"starships"])
        _allFields = [Starship allFields];
    else if ([_entityName isEqualToString:@"species"])
        _allFields = [Specie allFields];
    
    if (!fields) {
        [userDefaults setObject:_allFields forKey:settingsID];
        [userDefaults synchronize];
    }
    
    [_alert showWithTitle:@"Settings"
               andMessage:@"Did you want to configure what fields will be displayed on details?"
              callbackYES:^(UIAlertAction *action) {
                  [self performSegueWithIdentifier:@"segueSettingsId" sender:nil];
              } callbackNO:^(UIAlertAction *action) {
                  [self performSegueWithIdentifier:@"segueDetailId" sender:nil];
              }];
    
    return YES;
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
    BaseNSManagedObject *instance = _entities[indexPath.item];
    [instance updateLastSeen];
    
    if ([segue.destinationViewController isKindOfClass:[SettingsTableViewController class]]) {
        SettingsTableViewController *vc = (SettingsTableViewController *)segue.destinationViewController;
        
        vc.title = [NSString stringWithFormat:@"Settings %@", [_entityName uppercaseString]];
        vc.entityName = _entityName;
        vc.allFields = _allFields;
    } else {
        DetailTableViewController *vc = (DetailTableViewController *)segue.destinationViewController;
        
        vc.title = [NSString stringWithFormat:@"Detail %@", [_entityName uppercaseString]];
        vc.instance = instance;
        vc.settingsID = [NSString stringWithFormat:SETTINGS_ID, _entityName];
    }
}

@end