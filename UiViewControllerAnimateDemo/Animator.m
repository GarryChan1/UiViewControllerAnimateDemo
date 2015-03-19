//
//  Animator.m
//  UiViewControllerAnimateDemo
//
//  Created by cdz on 15-3-19.
//  Copyright (c) 2015年 emiage mini1. All rights reserved.
//

#import "Animator.h"

#define SCREENHEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREENWIDTH ([[UIScreen mainScreen] bounds].size.width)

@implementation Animator

//参考 http://www.th7.cn/Program/IOS/201409/281547.shtml
// This is used for percent driven interactive transitions, as well as for container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 3.0;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController* toController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    //添加toController到上下文
    [[transitionContext containerView] insertSubview:toController.view belowSubview:fromController.view];
    //自定义动画
    toController.view.alpha = 0;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromController.view.transform = CGAffineTransformMakeTranslation(-SCREENWIDTH, -SCREENHEIGHT);

        toController.view.alpha = 1;
    } completion:^(BOOL finished) {
        fromController.view.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}
@end
