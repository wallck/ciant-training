//
//  ViewController.m
//  notificacoesLocais
//
//  Created by Wallace Goncalves de Oliveira on 15/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    
}

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation ViewController

- (IBAction)dispararNotificacao:(UIButton *)sender {
    UILocalNotification *notification = [[UILocalNotification alloc] init];

    // titulo (apple watch)
    notification.alertTitle = @"[Watch] Notificação Local";
    
    // corpo (iOS)
    notification.alertBody = @"[iOS] Corpo da notificação, aparece em todos os dispositivos.";
    
    // data do agendamento
    // NOTA: estou agendando somente para testar, para enviar imediatamente
    //       nao é necessário adicionar 'firedate'
    //notification.fireDate = [[NSDate date] dateByAddingTimeInterval:15];
    
    // caso queira, podemos modificar a badge
    notification.applicationIconBadgeNumber = 1;
    
    // caso utilize categoria
    notification.category = @"categoria-identificador";
    
    // enviando
    //[UIApplication.sharedApplication scheduleLocalNotification:notification];
    
    // enviando na hora
    [UIApplication.sharedApplication presentLocalNotificationNow:notification];
}

- (IBAction)agendarNoficacao:(UIButton *)sender {
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    
    // titulo (apple watch)
    notification.alertTitle = @"[Watch] Notificação Local Agendada";
    
    // corpo (iOS)
    notification.alertBody = @"[iOS] Corpo da notificação agendada, aparece em todos os dispositivos.";
    
    notification.applicationIconBadgeNumber = 1;
    
    notification.category = @"categoria-identificador";
    notification.fireDate = _datePicker.date;
    
    [UIApplication.sharedApplication scheduleLocalNotification:notification];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // 1 - Categorias
    
    // ações
    UIMutableUserNotificationAction *action1 = [[UIMutableUserNotificationAction alloc] init];
    action1.identifier = @"acao1-identificador";
    action1.title = @"Ação 1";
    action1.activationMode = UIUserNotificationActivationModeBackground;
    
    UIMutableUserNotificationAction *action2 = [[UIMutableUserNotificationAction alloc] init];
    action2.identifier = @"acao2-identificador";
    action2.title = @"Ação 2";
    action2.activationMode = UIUserNotificationActivationModeForeground;
    action2.authenticationRequired = YES;
    action2.destructive = YES;
    
    UIMutableUserNotificationCategory *category = [[UIMutableUserNotificationCategory alloc] init];
    category.identifier = @"categoria-identificador";
    [category setActions:@[ action1, action2 ]
              forContext:UIUserNotificationActionContextMinimal];
    
    // 2 - configurar pedido ao usuario
    UIUserNotificationType types =
    (
     UIUserNotificationTypeAlert |
     UIUserNotificationTypeBadge |
     UIUserNotificationTypeSound
     );
    
    UIUserNotificationSettings *settings = [UIUserNotificationSettings
                                            settingsForTypes:types categories:(NSSet *)@[ category ]];
    
    // 3 - pedir autorizacao
    [UIApplication.sharedApplication registerUserNotificationSettings:settings];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

@end
