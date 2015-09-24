//
//  OrdersViewController.m
//  desafioCoreData
//
//  Created by Wallace Goncalves de Oliveira on 11/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "OrdersViewController.h"
#import "AlertBox.h"
#import "OrderTableViewCell.h"
#import <CoreData/CoreData.h>

#define CELL_ID @"CellId"

@interface OrdersViewController () <UITableViewDataSource, UITableViewDelegate> {
    NSArray *_orders;
    AlertBox *_alert;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation OrdersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _alert = [AlertBox newWithViewController:self];
    
    [self fetchOrders];
}

- (void)fetchOrders {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:[OrderItem entityName]];
    
    NSError *error = nil;
    _orders = [self.context executeFetchRequest:request
                                          error:&error];
}

- (IBAction)addOrder:(UIBarButtonItem *)sender {
    UITextField *tf = [UITextField new];
    tf.placeholder = @"Product Name";
    
    [_alert showTextField:tf WithTitle:@"New Order" andMessage:@"Please write a product" callback:^(UIAlertAction *action) {
        Client *client = [Client firstByName:@"Wallace Oliveira" context:self.context];
        
        Order *order = [Order newEntity:self.context];
        order.orderDate = [NSDate new];
        
        [client addOrdersObject:order];
        
        Product *p = [Product newEntity:self.context];
        p.name = _alert.currentTextField.text;
        p.details = _alert.currentTextField.text;
        p.salePrice = @( (double)arc4random_uniform(30) + (((float)rand() / RAND_MAX) * 30) );
        
        OrderItem *oi = [OrderItem newEntity:self.context];
        oi.product = p;
        oi.quantity = @( (arc4random() % 5) + 1 );
        oi.totalPrice = @( oi.quantity.doubleValue * p.salePrice.doubleValue );
        
        [order addOrderItensObject:oi];
        order.totalPrice = oi.totalPrice;
        
        [self saveContext];
        [self fetchOrders];
        [_tableView reloadData];
    }];
}

#pragma mark - TableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _orders.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];
    
    OrderItem *oi = _orders[indexPath.item];
    Order *order = (Order*)oi.order;
    
    cell.clientNameLabel.text = order.client.name;
    cell.clientPicture.image = order.client.picture;
    
    cell.productPicture.image = oi.product.picture;
    cell.productNameLabel.text = oi.product.name;
    cell.productDatailsLabel.text = oi.product.details;
    cell.salePriceLabel.text = [NSString stringWithFormat:@"R$ %.2f", oi.product.salePrice.doubleValue];
    
    cell.quantityLabel.text = oi.quantity.stringValue;
    cell.totalPriceLabel.text = [NSString stringWithFormat:@"R$ %.2f", oi.totalPrice.doubleValue];
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
