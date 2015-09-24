//
//  ProdutoTableViewCell.h
//  reloadTabela
//
//  Created by Wallace Goncalves de Oliveira on 31/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProdutoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labelNome;
@property (weak, nonatomic) IBOutlet UILabel *labelSKU;
@property (weak, nonatomic) IBOutlet UIImageView *imageFoto;

@end
