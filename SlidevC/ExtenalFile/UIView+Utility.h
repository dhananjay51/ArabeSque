//
//  UIView+Utility.h
//  StyleApp
//
//  Created by techtreeit systems on 9/16/16.
//  Copyright © 2016 techtreeit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewConstants.h"
@interface UIView (Utility)

- (void)makeShadowIffect;

/**
 * @discussion This method makes any view to circle view
 */
- (void)makeCircle;
- (void)makeRoundedCornor;


/**
 * @discussion This method set cornor redious with border width and color.
 * @param redious The float value of cornor redious
 * @param border  A Bool flag used to show border on view if YES
 * @param color  UIColor for border
 * @param width  Widht of border
 */
- (void)setCornorRediousRounded:(CGFloat)redious andBorder:(BOOL)border withBorderColor:(UIColor *)color andBorderWidth:(CGFloat)width;



- (void)roundCornorsTopLeft:(BOOL)topLeft topRight:(BOOL)topRight bottomLeft:(BOOL)bottomLeft bottomRight:(BOOL)bottomRight withRedius:(float)redius;

- (void)makeCardView;

- (void)createShadowIffectWithShadowSize:(float)shadowSize onTop:(BOOL)top bottom:(BOOL)bootom right:(BOOL)right andLeft:(BOOL)left;

@end
