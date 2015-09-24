//
//  ViewController.m
//  iCracha
//
//  Created by Wallace Goncalves de Oliveira on 25/08/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

// iCracha
//
// Classe Funcionario/Pessoa (modelo)
//      - nome, cargo, bio, foto, badges

// ViewController Exibir
//      - mostrar dados, badges (scrollView)
//                       bonus |) () (|
//      - botao editar chamando outro ViewController

// View Controller Editar
//      - campos editaveis de texto com as mesmas informações da tela de exibir
//      - botao 'pronto' para voltar as informações para a tela anterior


#import "ViewController.h"
#import "EditEmployeeViewController.h"
#import "Employee.h"
#import "Badge.h"

#define IMAGEM_RECT CGRectMake(0, 0, 57, 57)

@interface ViewController () {
    NSMutableArray *__employees;
    int __currentEmployee;
}

@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewEmployeePicture;
@property (weak, nonatomic) IBOutlet UILabel *labelBiography;
@property (weak, nonatomic) IBOutlet UILabel *labelWorkPlace;
@property (weak, nonatomic) IBOutlet UILabel *labelSalary;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewBadges;
@property (weak, nonatomic) IBOutlet UILabel *labelBadge;

@end

@interface ViewController (ScrollViewDelegate) <UIScrollViewDelegate>
@end

@implementation ViewController

- (IBAction)changeEmployee:(id)sender {
    
}
- (IBAction)nextEmployee:(UIButton *)sender {
    __currentEmployee = (__currentEmployee + 1) % __employees.count;
    [self loadCurrentEmployee];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    __currentEmployee = 0;
    [self initializeEmployees];
}

-(void)viewDidAppear:(BOOL)animated {
    [self loadCurrentEmployee];
}

-(void)initializeEmployees {
    __employees = [NSMutableArray array];
    
    Employee *priscilla = [Employee newWithName:@"Priscilla Andrade" workPlace:@"Farmaceutica" salary:@75432.32 biography:@"Linda, cheirosa, competente e muito teimosa! ❤️"];
    [priscilla addBadge:@"Primeiro Desafio" andStoredImageName:BADGE_FIRST_CHALLENGE];
    [priscilla addBadge:@"Segundo Desafio" andStoredImageName:BADGE_SECOND_CHALLENGE];
    [priscilla addBadge:@"Bom Motorista" andStoredImageName:BADGE_GOOD_DRIVER];
    [priscilla addBadge:@"Terceiro Desafio" andStoredImageName:BADGE_THIRD_CHALLENGE];
    [priscilla addBadge:@"Fotogênica" andStoredImageName:BADGE_PHOTOGENIC];
    [priscilla setPictureByStoredImageName:@"funcionario1"];
    
    [__employees addObject:priscilla];
    
    Employee *wallace = [Employee newWithName:@"Wallace Oliveira" workPlace:@"Engenheiro de Software" salary:@30450.65 biography:@"Chato pra caraleo!"];
    [wallace addBadge:@"Primeiro Desafio" andStoredImageName: BADGE_FIRST_CHALLENGE];
    [wallace addBadge:@"Segundo Desafio" andStoredImageName: BADGE_SECOND_CHALLENGE];
    [wallace addBadge:@"Desafio Campeão" andStoredImageName: BADGE_CHAMPION_CHALLENGE];
    [wallace addBadge:@"Pontual" andStoredImageName: BADGE_PONCTUAL];
    [wallace addBadge:@"Bom Motorista" andStoredImageName: BADGE_GOOD_DRIVER];
    [wallace addBadge:@"Homem Cego" andStoredImageName: BADGE_BLIND_GUY];
    [wallace addBadge:@"Funcionário Destaque" andStoredImageName: BADGE_BEST_EMPLOYEE];
    [wallace setPictureByStoredImageName:@"funcionario2"];
    
    [__employees addObject:wallace];
}

-(void)loadCurrentEmployee {
    Employee *e = __employees[__currentEmployee];
    
    self.labelName.text = e.name;
    self.imageViewEmployeePicture.image = e.picture;
    self.labelBiography.text = e.biography;
    self.labelWorkPlace.text = e.workPlace;
    self.labelSalary.text = [NSString stringWithFormat:@"R$ %.2f", [e.salary doubleValue]];
    
    [self loadBadges:e.badges];
}

-(void)loadBadges:(NSArray*)badges {
    // criar os imageViews dinamicamente
    CGRect rect = IMAGEM_RECT;
    rect.size.width = IMAGEM_RECT.size.width * 2 * badges.count;
    UIView *container = [[UIView alloc] initWithFrame: rect];
    
    for (int i = 0; i < badges.count; i++) {
        Badge *b = badges[i];
        
        rect = IMAGEM_RECT;
        rect.origin.x = IMAGEM_RECT.size.width / 2 + IMAGEM_RECT.size.width * 2 * i;
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:b.picture];
        imageView.frame = rect;
        
        [container addSubview:imageView];
    }
    
    // removendo qualquer view no scrollView
    while (self.scrollViewBadges.subviews.count > 1)
        [self.scrollViewBadges.subviews.firstObject removeFromSuperview];
    
    // adicionar a view no scrollView
    [self.scrollViewBadges addSubview:container];
    // setar o 'contentSize' do scrollView para o 'frame' da view
    [self.scrollViewBadges setContentSize:container.frame.size];
    // parte 2: habilitar a paginação no scrollView
    [self.scrollViewBadges setPagingEnabled:YES];
    
    Badge *b = badges[0];
    self.labelBadge.text = b.name;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    EditEmployeeViewController *vc = segue.destinationViewController;
    vc.segueEmployee = __employees[__currentEmployee];
}

@end

@implementation ViewController (ScrollViewDelegate)

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    Employee *e = __employees[__currentEmployee];
    NSInteger currentPage = (NSInteger)(self.scrollViewBadges.contentOffset.x / scrollView.frame.size.width);
    Badge *b = e.badges[currentPage];
    
    self.labelBadge.text = b.name;
}

@end
