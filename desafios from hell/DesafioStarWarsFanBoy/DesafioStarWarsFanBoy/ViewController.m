//
//  ViewController.m
//  DesafioStarWarsFanBoy
//
//  Created by Wallace Goncalves de Oliveira on 16/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"
#import "MenuTableViewController.h"
#import "CoreDataManager.h"
#import "CoreDataFilmController.h"
#import "CoreDataPeopleController.h"
#import "CoreDataPlanetController.h"
#import "CoreDataSpecieController.h"
#import "CoreDataVehicleController.h"
#import "CoreDataStarshipController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;

@end

@implementation ViewController

- (void)initContextFromAppDelegate {
    _appDelegate = UIApplication.sharedApplication.delegate;
    _context = _appDelegate.managedObjectContext;
}

- (void)saveContext {
    if (!_appDelegate) [self initContextFromAppDelegate];
    [_appDelegate saveContext];
}

-(void)ligarSpinner {
    [_activity startAnimating];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initContextFromAppDelegate];
}

-(void)viewDidAppear:(BOOL)animated {
    [self performSelector:@selector(ligarSpinner) withObject:nil afterDelay:0];
    [self performSelector:@selector(firstLoad) withObject:nil afterDelay:2];
}

- (void)firstLoad {
    [CoreDataFilmController loadByContext:_context];
    [CoreDataPlanetController loadByContext:_context];
    [CoreDataSpecieController loadByContext:_context];
    [CoreDataPeopleController loadByContext:_context];
    [CoreDataVehicleController loadByContext:_context];
    [CoreDataStarshipController loadByContext:_context];
    
    [self performSegueWithIdentifier:@"segueMenuId" sender:nil];
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    MenuTableViewController *vc = (MenuTableViewController *)segue.destinationViewController;
    vc.context = _context;
}

@end
