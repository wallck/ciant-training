//
//  AppDelegate.m
//  notificacoesLocais
//
//  Created by Wallace Goncalves de Oliveira on 15/09/15.
//  Copyright © 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return YES;
}

-(void)applicationDidBecomeActive:(UIApplication *)application {
    // limpando o numero da badge (quantidade notificacoes do app na home)
    application.applicationIconBadgeNumber = 0;
    
    // prodemos chamar de qualquer lugar no aplicativo utilizando
    //UIApplication.sharedApplication.applicationIconBadgeNumber = 3;
}

#pragma mark - Local Notifications

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)        application:(UIApplication *)application
 handleActionWithIdentifier:(NSString *)identifier
       forLocalNotification:(UILocalNotification *)notification
          completionHandler:(void (^)())completionHandler {

    NSLog(@"%@ - %@", NSStringFromSelector(_cmd), identifier);
    
    // IMPORTANTE:  sempre que existir um 'completionHandler'
    //              ele deverá ser chamado assim que acabar
    //              o processamento
    
    if (completionHandler) completionHandler();
}

- (void)        application:(UIApplication *)application
 handleActionWithIdentifier:(NSString *)identifier
       forLocalNotification:(UILocalNotification *)notification
           withResponseInfo:(nonnull NSDictionary *)responseInfo
          completionHandler:(void (^)())completionHandler {

    NSLog(@"%@ - %@", NSStringFromSelector(_cmd), identifier);
    NSLog(@"%@", responseInfo);
    
    // IMPORTANTE:  sempre que existir um 'completionHandler'
    //              ele deverá ser chamado assim que acabar
    //              o processamento
    
    if (completionHandler) completionHandler();
}

@end