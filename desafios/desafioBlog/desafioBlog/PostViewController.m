//
//  PostViewController.m
//  desafioBlog
//
//  Created by Wallace Goncalves de Oliveira on 04/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#define CELL_ID @"CommentCellId"

#import "PostViewController.h"
#import "Post.h"
#import "Comment.h"
#import "CommentTableViewCell.h"

@interface PostViewController () <UITableViewDataSource, UITableViewDelegate> {
    
}

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *bodyLabel;
@property (weak, nonatomic) IBOutlet UITableView *commentTableView;

@end

@implementation PostViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = _post.title;
    _titleLabel.text = _post.title;
    _bodyLabel.text = _post.body;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

#pragma mark - TableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _post.comments.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];
    
    Comment *comment = _post.comments[indexPath.item];
    
    cell.userLabel.text = comment.name;
    cell.titleLabel.text = comment.email;
    cell.bodyTextView.text = comment.body;
    
    return cell;
}

@end
