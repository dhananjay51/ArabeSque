//
//  displayAlertView.h
//  
//
//  Created by Praveen on 06/07/15.
//  Copyright (c) 2015 TechTree IT Systems (P) Ltd. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIAlertView+Blocks.h"

@interface displayAlertView : NSObject
{
}
+ (void) displayAlertView : (NSString *) title andMessage:(NSString *) message;
+ (void)displayFullViewActivityIndicator : (UIView *) requestedView;
+ (void) removeFullViewActivityIndicator : (UIView *) requestedView;

//+ (void)displayFullMaterialActivityIndicator : (UIView *)requestedView withTitle:(NSString *)title;
//+ (void) removeFullMaterialViewActivityIndicator : (UIView *) requestedView;

+ (void)displaySmallActivityIndicator : (UIView *) requestedView;
+ (void) removeSmallViewActivityIndicator : (UIView *) requestedView;

+ (void) removeRefreshControl:(UIView *) requestedView;

//animation
+ (CAAnimation*) wiggleAnimation;
+ (CATransition *) viewControllerTransition;

+ (void) animateViewGrowAndAppearWithView:(UIView *) requestedView;
+ (void) animateViewDisappearAndShrinkWithView:(UIView *) requestedView;
+ (void) displayAlertController : (NSString *) title andMessage:(NSString *) message andCrrentView:(UIViewController*)CurrentViewController byUsingNavigationController:(UINavigationController*)nav sendBack:(BOOL)isSendBack;

 
@end
