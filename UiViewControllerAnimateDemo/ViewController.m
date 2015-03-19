//
//  ViewController.m
//  UiViewControllerAnimateDemo
//
//  Created by cdz on 15-3-19.
//  Copyright (c) 2015年 emiage mini1. All rights reserved.
//

#import "ViewController.h"
#import "Animator.h"
#import "NextViewController.h"

@interface ViewController ()
@property (strong, nonatomic) Animator* animator;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"第一个页面";
    self.navigationController.delegate = self;
    self.view.backgroundColor = [UIColor orangeColor];
    self.animator = [[Animator alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController*)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController*)fromVC toViewController:(UIViewController*)toVC
{
    if (operation == UINavigationControllerOperationPush) {
        return self.animator;
    }
    else if (operation == UINavigationControllerOperationPop) {
        return self.animator;
    } else {
        return nil;
    }
}

- (IBAction)nextBtnP:(UIButton*)sender
{
    NextViewController* next = [[NextViewController alloc] init];
    [self.navigationController pushViewController:next animated:YES];
}

@end
