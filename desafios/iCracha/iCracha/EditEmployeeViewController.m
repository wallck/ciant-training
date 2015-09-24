//
//  EditEmployeeViewController.m
//  iCracha
//
//  Created by Wallace Goncalves de Oliveira on 25/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "EditEmployeeViewController.h"

@interface EditEmployeeViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textFieldName;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewPicture;
@property (weak, nonatomic) IBOutlet UITextView *textViewBiography;
@property (weak, nonatomic) IBOutlet UITextField *textFieldWorkPlace;
@property (weak, nonatomic) IBOutlet UITextField *textFieldSalary;

@end

@implementation EditEmployeeViewController

- (IBAction)backToView:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveEmployee:(UIButton *)sender {
    self.segueEmployee.name = self.textFieldName.text;
    self.segueEmployee.biography = self.textViewBiography.text;
    self.segueEmployee.workPlace = self.textFieldWorkPlace.text;
    self.segueEmployee.salary = [NSNumber numberWithDouble: [self.textFieldSalary.text doubleValue]];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadCurrentEmployee];
}

-(void)loadCurrentEmployee {
    Employee *e = self.segueEmployee;
    
    self.textFieldName.text = e.name;
    self.imageViewPicture.image = e.picture;
    self.textViewBiography.text = e.biography;
    self.textFieldWorkPlace.text = e.workPlace;
    self.textFieldSalary.text = [NSString stringWithFormat:@"%.2f", [e.salary doubleValue]];
}

@end
