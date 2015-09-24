//
//  ViewController.m
//  desafioCoreData
//
//  Created by Wallace Goncalves de Oliveira on 11/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"

// Modelar uma lista de compras
// e exibir uma tabela

@interface ViewController ()

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

- (void)initializeDataBase {
    if ([self isDataBaseInitialized]) return;
    
    Client *wallace = [Client newEntity:_context];
    wallace.name = @"Wallace Oliveira";
    wallace.picture = [UIImage imageNamed:@"funcionario2"];
    
    Order *order = [Order newEntity:_context];
    order.orderDate = [NSDate new];
    order.totalPrice = @0;
    
    [wallace addOrdersObject: order];
    
    OrderItem *orderItemBeer = [OrderItem newEntity:_context];
    orderItemBeer.quantity = @1;
    orderItemBeer.totalPrice = @0;
    
    [order addOrderItensObject:orderItemBeer];
    
    Product *productBeer = [Product newEntity:_context];
    productBeer.name = @"Chopp Capitão";
    productBeer.details = @"Chopp Backer Capitão Senra";
    productBeer.picture = [UIImage imageNamed:@"cerveja1"];
    productBeer.salePrice = @10.9;
    
    orderItemBeer.product = productBeer;
    orderItemBeer.totalPrice = @(orderItemBeer.totalPrice.doubleValue + productBeer.salePrice.doubleValue);
    order.totalPrice = @(order.totalPrice.doubleValue + productBeer.salePrice.doubleValue);
    
    OrderItem *orderItemBeerMeat = [OrderItem newEntity:_context];
    orderItemBeerMeat.quantity = @1;
    orderItemBeerMeat.totalPrice = @0;
    
    [order addOrderItensObject:orderItemBeerMeat];
    
    Product *productBeerMeat = [Product newEntity:_context];
    productBeerMeat.name = @"Chopp Claro com Picanha e Fritas";
    productBeerMeat.details = @"Chopp Claro Pilsen Backer acompanha Picanha e Fritas";
    productBeerMeat.picture = [UIImage imageNamed:@"cerveja5"];
    productBeerMeat.salePrice = @23.4;
    
    orderItemBeerMeat.product = productBeerMeat;
    orderItemBeerMeat.totalPrice = @(orderItemBeerMeat.totalPrice.doubleValue + productBeerMeat.salePrice.doubleValue);
    order.totalPrice = @(order.totalPrice.doubleValue + productBeerMeat.salePrice.doubleValue);
    
    [self saveContext];
}

- (BOOL)isDataBaseInitialized {
    NSFetchRequest *request = [[NSFetchRequest alloc]
                               initWithEntityName:[Client entityName]];
    
    NSError *error = nil;
    NSArray *results = [_context executeFetchRequest:request
                                                   error:&error];
    
    return results.count > 0;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initContextFromAppDelegate];
    [self initializeDataBase];
}

@end