//
//  TasksViewController.m
//  desafioGeral
//
//  Created by Wallace Goncalves de Oliveira on 02/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "TasksViewController.h"
#import "AlertBox.h"
#import "Task.h"

#define CELL_ID @"CellTaskId"

@interface TasksViewController () <UITableViewDataSource, UITableViewDelegate> {
    AlertBox *_alert;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *labelWelcomeUser;

@end

@implementation TasksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _alert = [AlertBox newWithViewController:self];
}

-(void)viewDidAppear:(BOOL)animated {
    _labelWelcomeUser.text = [NSString stringWithFormat:@"Welcome, %@", _user.userName];
}

- (IBAction)newTaskTouchUpInside:(UIButton *)sender {
    UITextField *tf = [UITextField new];
    tf.placeholder = @"Task Description";
    
    [_alert showTextField:tf WithTitle:@"New Task" andMessage:@"Please write a new Task" callback:^(UIAlertAction *action) {
        Task *task = [Task newWithName:_alert.currentTextField.text];
        [_user.tasks addObject: task];
        [_tableView reloadData];
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    self.title = [NSString stringWithFormat:@"Tasks (%d)", (int)_user.tasks.count];
    return _user.tasks.count;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    Task *task = _user.tasks[indexPath.item];
    NSMutableAttributedString *taskText = [[NSMutableAttributedString alloc] initWithString:task.name];
    
    if (!task.status) {
        [taskText addAttribute:NSStrikethroughStyleAttributeName value:@1 range:NSMakeRange(0, task.name.length)];
    }
    
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:CELL_ID];
    cell.textLabel.attributedText = taskText;
    return cell;
}

-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Task *task = _user.tasks[indexPath.item];
    
    UITableViewRowAction *editAction = [UITableViewRowAction
                                        rowActionWithStyle:UITableViewRowActionStyleDefault
                                        title:@"Edit"
                                        handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
                                            UITextField *tf = [UITextField new];
                                            tf.placeholder = @"Task Description";
                                            tf.text = task.name;
                                            
                                            [_alert showTextField:tf WithTitle:@"Edit Task" andMessage:@"Please write bellow" callback:^(UIAlertAction *action) {
                                                task.name = _alert.currentTextField.text;
                                                [_tableView reloadData];
                                            }];
                                        }];
    
    UITableViewRowAction *deleteAction = [UITableViewRowAction
                                          rowActionWithStyle:UITableViewRowActionStyleDestructive
                                          title:@"Delete"
                                          handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
                                              [_user.tasks removeObjectAtIndex:indexPath.item];
                                              [_tableView reloadData];
                                          }];
    
    UITableViewRowAction *doneAction = [UITableViewRowAction
                                        rowActionWithStyle:UITableViewRowActionStyleDefault
                                        title:@"Done"
                                        handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
                                            task.status = NO;
                                            [_tableView reloadData];
                                        }];
    
    UITableViewRowAction *undoneAction = [UITableViewRowAction
                                        rowActionWithStyle:UITableViewRowActionStyleDefault
                                        title:@"Undone"
                                        handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
                                            task.status = YES;
                                            [_tableView reloadData];
                                        }];
    
    editAction.backgroundColor = [UIColor lightGrayColor];
    deleteAction.backgroundColor = [UIColor redColor];
    doneAction.backgroundColor = [UIColor blueColor];
    undoneAction.backgroundColor = [UIColor grayColor];
    
    return @[ editAction, deleteAction, (task.status ? doneAction : undoneAction) ];
}

@end
