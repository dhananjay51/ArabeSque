//
//  displayAlertView.m
//  
//
//  Created by Praveen on 06/07/15.
//  Copyright (c) 2015 TechTree IT Systems (P) Ltd. All rights reserved.
//

#import "displayAlertView.h"
#import "MMMaterialDesignSpinner.h"
#import "UIView+Utility.h"

@implementation displayAlertView
+ (void) displayAlertController : (NSString *) title andMessage:(NSString *) message andCrrentView:(UIViewController*)CurrentViewController byUsingNavigationController:(UINavigationController*)nav sendBack:(BOOL)isSendBack{
    if ([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0) {
        
        
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:title
                                              message:message
                                              preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"OK", @"Cancel action")
                                       style:UIAlertActionStyleCancel
                                       handler:^(UIAlertAction *action)
                                       {
                                           if (isSendBack && nav) {
                                               [nav popViewControllerAnimated:YES];
                                               
                                           }else if(isSendBack){
                                               [CurrentViewController dismissViewControllerAnimated:YES completion:nil];
                                               
                                           }
                                       }];
        [alertController addAction:cancelAction];
        
        [CurrentViewController presentViewController:alertController animated:YES completion:nil];
    }else{
        
        UIAlertView *alertView=[UIAlertView showWithTitle:title message:message style:UIAlertViewStyleDefault cancelButtonTitle:@"OK" otherButtonTitles:nil tapBlock:^(UIAlertView *alertView, NSInteger buttonIndex){
            if (buttonIndex==[alertView cancelButtonIndex]) {
                if (isSendBack) {
                    [nav popViewControllerAnimated:YES];
                    
                }else if(isSendBack){
                    [CurrentViewController dismissViewControllerAnimated:YES completion:nil];
                    
                }
            }
        }];
        
        
//        UIAlertView *alertMsg = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        //[alertMsg show];
//        [alertMsg performSelector:@selector(show) onThread:[NSThread mainThread] withObject:nil waitUntilDone:NO];
//        alertMsg.delegate = nil;
//        alertMsg = nil;
    }

}
+ (void) displayAlertView : (NSString *) title andMessage:(NSString *) message;
{
     if ([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0) {
    UIViewController *current=  [UIApplication sharedApplication].keyWindow.rootViewController;
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:title
                                          message:message
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"OK", @"Cancel action")
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction *action)
                                   {
                                       
                                   }];
       [alertController addAction:cancelAction];
    
    [current presentViewController:alertController animated:YES completion:nil];
     }else{
    
        UIAlertView *alertMsg = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    //[alertMsg show];
        [alertMsg performSelector:@selector(show) onThread:[NSThread mainThread] withObject:nil waitUntilDone:NO];
        alertMsg.delegate = nil;
        alertMsg = nil;
     }
    
   }


#pragma mark - Activity Indicator Views
+ (void)displayFullViewActivityIndicator : (UIView *) requestedView;
{
    
    UIView *tmpView = (UIView *)[requestedView viewWithTag:420];    //instantiate and see if view already exist. if so then delete the view and recreate it.

    if( [tmpView isDescendantOfView:requestedView])  
        [tmpView removeFromSuperview];
    
   
    
        UIView *viewActivityIndicatorBackground;
        viewActivityIndicatorBackground = [[UIView alloc] init];
        viewActivityIndicatorBackground.backgroundColor = [UIColor clearColor];
        viewActivityIndicatorBackground.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
        viewActivityIndicatorBackground.tag = 420;
        //self.view = baseView;
        UIView *lSmallView = [[UIView alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].origin.x / 2, [[UIScreen mainScreen] bounds].origin.y / 2, 100, 100)];
        lSmallView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.4];
        lSmallView.center = viewActivityIndicatorBackground.center;
        lSmallView.layer.cornerRadius = 5;
        [viewActivityIndicatorBackground addSubview:lSmallView];
        
        UIActivityIndicatorView *activityIndicator;
        activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        activityIndicator.center = lSmallView.center;
        activityIndicator.tag = 440;
        [activityIndicator startAnimating];
        
        //AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];     //Take control over full screen
        
        [viewActivityIndicatorBackground addSubview:activityIndicator ];
        [requestedView addSubview:viewActivityIndicatorBackground];
        //[[UIApplication sharedApplication].delegate.window addSubview:viewActivityIndicatorBackground];
    
    
}

+ (void) removeFullViewActivityIndicator : (UIView *) requestedView;
{
    
    
    UIActivityIndicatorView *tmpAI = (UIActivityIndicatorView *)[requestedView viewWithTag:440];
    __block UIView *tmpView = (UIView *)[requestedView viewWithTag:420];
    
    
    [UIView animateWithDuration:0.2
                     animations:^{
                         tmpView.transform = CGAffineTransformMakeScale(0.6, 0.6);
                         tmpView.alpha = 0.0;
                         tmpAI.alpha = 0.0;
                         tmpAI.transform = CGAffineTransformIdentity;
                         
                         
                     } completion:^(BOOL finished) {
                         [tmpAI stopAnimating];
                         [tmpView removeFromSuperview];
                         tmpView = nil;
                         
                     }];
    
    
    /*
    [UIView animateWithDuration:0.3
                     animations:^{
                         tmpView.transform = CGAffineTransformMakeScale(1.5, 1.5);
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.2
                                          animations:^{
                                              tmpAI.transform = CGAffineTransformIdentity;
                                              tmpAI.alpha = 0.0;

                                              
                                          } completion:^(BOOL finished) {
                                              [tmpAI stopAnimating];
                                              [tmpView removeFromSuperview];
                                              tmpView = nil;
                                              
                                          }];
                     }];
    
*/
    
    /*
    UIActivityIndicatorView *tmpAI = (UIActivityIndicatorView *)[requestedView viewWithTag:440];
    UIView *tmpView = (UIView *)[requestedView viewWithTag:420];

    [tmpAI stopAnimating];
    [tmpView removeFromSuperview];
    tmpView = nil;
    */
}



+ (void)displayFullMaterialActivityIndicator : (UIView *)requestedView withTitle:(NSString *)title{
    
    UIView *tmpView = (UIView *)[requestedView viewWithTag:420];    //instantiate and see if view already exist. if so then delete the view and recreate it.
    
    if( [tmpView isDescendantOfView:requestedView])
        [tmpView removeFromSuperview];
    
    
    
    UIView *viewActivityIndicatorBackground;
    viewActivityIndicatorBackground = [[UIView alloc] init];
    //viewActivityIndicatorBackground.backgroundColor = [UIColor clearColor];
    viewActivityIndicatorBackground.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.35];
    
    viewActivityIndicatorBackground.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    viewActivityIndicatorBackground.tag = 420;
    //self.view = baseView;
    
    
    
    
    UIView *lSmallView = [[UIView alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].origin.x / 2, [[UIScreen mainScreen] bounds].origin.y / 2, 250, 110)];
    lSmallView.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.93];
    //lSmallView.backgroundColor = [UIColor whiteColor];
    
    lSmallView.center = viewActivityIndicatorBackground.center;
    lSmallView.layer.cornerRadius = kCornorRedious;
    [viewActivityIndicatorBackground addSubview:lSmallView];
    [lSmallView makeCardView];
    
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 250, 30)];
    //    headerView.backgroundColor = [UIColor lightGrayColor];
    UILabel *headerLbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 4, 250, 29)];
    headerLbl.text = @"Please Wait";
    headerLbl.textAlignment = NSTextAlignmentCenter;
    headerLbl.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:17];
    //    headerLbl.backgroundColor = [UIColor whiteColor];
    
    [headerView addSubview:headerLbl];
    
    
    MMMaterialDesignSpinner *spinner  = [[MMMaterialDesignSpinner alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].origin.x / 2, [[UIScreen mainScreen] bounds].origin.y / 2, 40, 40)];
    CGPoint spinerCenter = CGPointMake(lSmallView.center.x, lSmallView.center.y+6);
    spinner.center = spinerCenter;
    
    spinner.lineWidth = 4;
    //ToDo:    spinner.duration = .75;
    spinner.tintColor = [UIColor blueColor];
    //    spinner.tintColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.4];
    [spinner startAnimating];
    spinner.tag = 440;
    
    UILabel *titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(lSmallView.bounds)-30, CGRectGetWidth(lSmallView.bounds), 30)];
    titleLbl.text = title;
    titleLbl.font = [UIFont fontWithName:@"HelveticaNeue" size:14.0];
    titleLbl.numberOfLines = 0;
    //[titleLbl sizeToFit];
    titleLbl.textColor = [UIColor blackColor];
    [titleLbl setTextAlignment:NSTextAlignmentCenter];
    
    
    
    [lSmallView addSubview:headerView];
    [lSmallView addSubview:spinner];
    [lSmallView addSubview:titleLbl];
    
    
    //    UIActivityIndicatorView *activityIndicator;
    //    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    //    activityIndicator.center = lSmallView.center;
    //    activityIndicator.tag = 440;
    //    [activityIndicator startAnimating];
    
    //AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];     //Take control over full screen
    
    [viewActivityIndicatorBackground addSubview:spinner];
    [requestedView addSubview:viewActivityIndicatorBackground];
    //[[UIApplication sharedApplication].delegate.window addSubview:viewActivityIndicatorBackground];
    
    
}


+ (void) removeFullMaterialViewActivityIndicator : (UIView *) requestedView{
    
    
    MMMaterialDesignSpinner *tmpAI = (MMMaterialDesignSpinner *)[requestedView viewWithTag:440];
    __block UIView *tmpView = (UIView *)[requestedView viewWithTag:420];
    
    
    [UIView animateWithDuration:0.2
                     animations:^{
                         tmpView.transform = CGAffineTransformMakeScale(0.6, 0.6);
                         tmpView.alpha = 0.0;
                         tmpAI.alpha = 0.0;
                         tmpAI.transform = CGAffineTransformIdentity;
                         
                         
                     } completion:^(BOOL finished) {
                         [tmpAI stopAnimating];
                         [tmpView removeFromSuperview];
                         tmpView = nil;
                         
                     }];
    
    
    /*
     [UIView animateWithDuration:0.3
     animations:^{
     tmpView.transform = CGAffineTransformMakeScale(1.5, 1.5);
     }
     completion:^(BOOL finished) {
     [UIView animateWithDuration:0.2
     animations:^{
     tmpAI.transform = CGAffineTransformIdentity;
     tmpAI.alpha = 0.0;
     
     
     } completion:^(BOOL finished) {
     [tmpAI stopAnimating];
     [tmpView removeFromSuperview];
     tmpView = nil;
     
     }];
     }];
     
     */
    
    /*
     UIActivityIndicatorView *tmpAI = (UIActivityIndicatorView *)[requestedView viewWithTag:440];
     UIView *tmpView = (UIView *)[requestedView viewWithTag:420];
     
     [tmpAI stopAnimating];
     [tmpView removeFromSuperview];
     tmpView = nil;
     */
}




+ (void)displaySmallActivityIndicator : (UIView *) requestedView;
{
    UIView *viewActivityIndicatorBackground;
    viewActivityIndicatorBackground = [[UIView alloc] init];
    viewActivityIndicatorBackground.backgroundColor = [UIColor clearColor];
    viewActivityIndicatorBackground.frame = CGRectMake(0, 90, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height - 90);
    viewActivityIndicatorBackground.tag = 520;
    //self.view = baseView;
    UIView *lSmallView = [[UIView alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].origin.x / 2, [[UIScreen mainScreen] bounds].origin.y / 2, 100, 100)];
    lSmallView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.4];
    lSmallView.center = viewActivityIndicatorBackground.center;
    lSmallView.layer.cornerRadius = 5;
    [viewActivityIndicatorBackground addSubview:lSmallView];
    
    UIActivityIndicatorView *activityIndicator;
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityIndicator.center = lSmallView.center;
    activityIndicator.tag = 540;
    [activityIndicator startAnimating];
    
    //AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];     //Take control over full screen
    
    [viewActivityIndicatorBackground addSubview:activityIndicator ];
    [requestedView addSubview:viewActivityIndicatorBackground];
    //[[UIApplication sharedApplication].delegate.window addSubview:viewActivityIndicatorBackground];
    
    
}

+ (void) removeSmallViewActivityIndicator : (UIView *) requestedView;
{
    
    
    UIActivityIndicatorView *tmpAI = (UIActivityIndicatorView *)[requestedView viewWithTag:540];
    __block UIView *tmpView = (UIView *)[requestedView viewWithTag:520];
    
    
    [UIView animateWithDuration:0.2
                     animations:^{
                         tmpView.transform = CGAffineTransformMakeScale(0.6, 0.6);
                         tmpView.alpha = 0.0;
                         tmpAI.alpha = 0.0;
                         tmpAI.transform = CGAffineTransformIdentity;
                         
                         
                     } completion:^(BOOL finished) {
                         [tmpAI stopAnimating];
                         [tmpView removeFromSuperview];
                         tmpView = nil;
                         
                     }];
    

    /*
    [UIView animateWithDuration:0.3
                     animations:^{
                         tmpView.transform = CGAffineTransformMakeScale(1.5, 1.5);
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.2
                                          animations:^{
                                              tmpAI.transform = CGAffineTransformIdentity;
                                              tmpAI.alpha = 0.0;
                                              
                                          } completion:^(BOOL finished) {
                                              [tmpAI stopAnimating];
                                              [tmpView removeFromSuperview];
                                              tmpView = nil;
                                              
                                          }];
                     }];
    
    */
    
    /*
    UIActivityIndicatorView *tmpAI = (UIActivityIndicatorView *)[requestedView viewWithTag:540];
    UIView *tmpView = (UIView *)[requestedView viewWithTag:520];
    
    [tmpAI stopAnimating];
    [tmpView removeFromSuperview];
    tmpView = nil;
    */
}


//Remove Refresh control indicator from table view on view-controller
+ (void) removeRefreshControl:(UIView *) requestedView {
    
    UIRefreshControl *tempRC = (UIRefreshControl *)[requestedView viewWithTag:7070];            //7070 is global Tag for any refreshControl
    
    if ([self doesViewExistWithComponent:tempRC onRequestedView:requestedView]) { //if component exist then remove it.
        [tempRC endRefreshing];
        tempRC = nil;
        
    }
}


//Check if the request component exist in the View
//viewComponent is say: uirefreshcontrol  and requestedView is self.view
+ (BOOL) doesViewExistWithComponent : (id) viewComponent onRequestedView:(UIView *) requestedView {
    
    return [requestedView.subviews containsObject:viewComponent];   //if refreshcontrol exist then return YES, else NO
    
}


//Wiggle Animation
//useage:  [btnAlertBell.layer addAnimation:[displayAlertView wiggleAnimation] forKey:@"wiggle"];
+ (CAAnimation*) wiggleAnimation
{
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    CGFloat wobbleAngle = 0.3f;
    
    NSValue* valLeft = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(wobbleAngle, 0.0f, 0.0f, 1.0f)];
    NSValue* valRight = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(-wobbleAngle, 0.0f, 0.0f, 1.0f)];
    animation.values = [NSArray arrayWithObjects:valLeft, valRight, nil];
    
    animation.autoreverses = YES;
    animation.duration = 0.125;
    animation.repeatCount = HUGE_VALF;
    
    return animation;
}



//Animation for bringing ViewController from PushViewController (Set animation NO)
//usage :  [alertsVC.view.layer addAnimation:[displayAlertView viewControllerTransition] forKey:nil];

+ (CATransition *) viewControllerTransition {
    
    CATransition *transitionVCAppearance = [CATransition animation];
    transitionVCAppearance.duration = 0.4;
    transitionVCAppearance.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transitionVCAppearance.type = kCATransitionReveal;
    transitionVCAppearance.subtype =kCATransitionFromLeft;
    transitionVCAppearance.delegate = self;
    
    return transitionVCAppearance;
    
}

//Animate to bring the subview grow and appear;

+ (void) animateViewGrowAndAppearWithView:(UIView *) requestedView {
    
    
    __block UIView *tmpView = (UIView *) requestedView;
    tmpView.alpha = 0.0;
    tmpView.transform = CGAffineTransformMakeScale(0.4, 0.4);
     
    [UIView animateWithDuration:0.2
                     animations:^{
                         tmpView.transform = CGAffineTransformMakeScale(1.0, 1.0);
                         tmpView.alpha = 1.0;
                         
                         
                     } completion:^(BOOL finished) {
                         //do nothing
                     }];
    

    

}

+ (void) animateViewDisappearAndShrinkWithView:(UIView *) requestedView {
    
    
    __block UIView *tmpView = (UIView *) requestedView;
 
    [UIView animateWithDuration:0.4
                     animations:^{
                         tmpView.transform = CGAffineTransformMakeScale(0.4, 0.4);
                         tmpView.alpha = 0.0;
                         
                         
                     } completion:^(BOOL finished) {
                         //do nothing
                        

                     }];
    
    
    
    
}

@end
