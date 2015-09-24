//
//  ViewController.m
//  desafioGeral
//
//  Created by Wallace Goncalves de Oliveira on 02/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"
#import "TasksViewController.h"
#import "User.h"
#import "Security.h"
#import "AlertBox.h"

@interface ViewController () <UITextFieldDelegate> {
    AlertBox *_alert;
    User *_authenticatedUser;
}

@property (weak, nonatomic) IBOutlet UITextField *textFieldUserName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPassword;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cBottom;

@end

@interface ViewController (Login)
-(void)doLogin;
-(void)doLogoff;
@end

@interface ViewController (Notifications)
-(void)addNotifications;
-(void)removeNotifications;
@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _alert = [AlertBox newWithViewController:self];
}

-(void)viewDidAppear:(BOOL)animated {
    [self doLogoff];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self addNotifications];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self removeNotifications];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    TasksViewController *vc = segue.destinationViewController;
    vc.user = _authenticatedUser;
}

- (IBAction)confirmTouchUpInside:(UIButton *)sender {
    [self doLogin];
}

// UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == _textFieldUserName)
        [_textFieldPassword becomeFirstResponder];
    else
        [self doLogin];
    
    return Security.authenticated;
}

-(void)redrawScreenHeight {
    CGFloat height = UIScreen.mainScreen.bounds.size.height;
    height -= [UIApplication sharedApplication].statusBarFrame.size.height;
    height -= self.navigationController.navigationBar.frame.size.height;
    [_cBottom setConstant:height];
}

@end

#pragma mark - Login
@implementation ViewController (Login)

-(void)doLogin {
    User *user = [self makeUser];
    
    [Security doLoginWithUser:user];
    
    if (Security.authenticated) {
        _authenticatedUser = user;
        NSString *welcomeMessage = [NSString stringWithFormat:@"Welcome, %@", user.userName];
        [_alert showWithTitle:@"Login" andMessage:welcomeMessage callback:^(UIAlertAction *action) {
            [self performSegueWithIdentifier:@"LoginToTasks" sender:nil];
        }];
    } else
        [_alert showWithTitle:@"Login" andMessage:@"Invelid login or password!"];
}

-(void)doLogoff {
    _authenticatedUser = nil;
    _textFieldUserName.text = @"";
    _textFieldPassword.text = @"";
    
    [_textFieldUserName becomeFirstResponder];
}

-(User*)makeUser {
    NSString *userName = _textFieldUserName.text;
    NSString *password = _textFieldPassword.text;
    return [User newWithUserName:userName password:password];
}

@end

#pragma mark - Notifications
@implementation ViewController (Notifictions)

-(void)addNotifications {
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    // Teclado
    [nc addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [nc addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    [nc addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    // Orientação
    [nc addObserver:self selector:@selector(keyboardDidChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
}

-(void)removeNotifications {
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    // Teclado
    [nc removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [nc removeObserver:self name:UIKeyboardDidHideNotification object:nil];
    [nc removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
    
    // Orientação
    [nc removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
}

-(void)keyboardDidShow:(NSNotification*)notification {
    NSValue *value = [notification.userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGFloat keyboardHeight = value.CGRectValue.size.height;
    [_cBottom setConstant:keyboardHeight];
}
-(void)keyboardDidHide:(NSNotification*)notification {
    [_cBottom setConstant:0];
}
-(void)keyboardWillChangeFrame:(NSNotification*)notification {
    //NSLog(@"%@", notification.userInfo.allKeys);
}
-(void)keyboardDidChange:(NSNotification*)notification {
    NSValue *value = [notification.userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGFloat keyboardHeight = value.CGRectValue.size.height;
    
    if (keyboardHeight > 1)
        [self redrawScreenHeight];
}

@end