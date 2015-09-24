//
//  PostsTableViewController.m
//  desafioBlog
//
//  Created by Wallace Goncalves de Oliveira on 04/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "PostsTableViewController.h"
#import "PostTableViewCell.h"
#import "PostViewController.h"
#import "Blog.h"
#import "Post.h"
#import "Comment.h"

#define CELL_ID @"CellPostId"

@interface PostsTableViewController () {
    Blog *_blog;
}

@end

@implementation PostsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _blog = [Blog loadCache];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _blog.posts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PostTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];
    
    Post *post = _blog.posts[indexPath.item];
    
    cell.titleLabel.text = post.title;
    cell.bodyLabel.text = post.body;
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    PostViewController *vc = segue.destinationViewController;
    
    NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
    Post *post = _blog.posts[indexPath.item];
    
    NSLog(@"%@", post.comments);
    
    if ([post loadComments])
        [_blog serialize];
    
    NSLog(@"%@", post.comments);
    
    vc.post = post;
}

@end
