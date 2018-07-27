//
//  UIView+Utility.m
//  StyleApp
//
//  Created by techtreeit systems on 9/16/16.
//  Copyright © 2016 techtreeit. All rights reserved.
//

#import "UIView+Utility.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (Utility)

- (void)makeShadowIffect{

    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    [self.layer setShadowOffset:CGSizeMake(-2.0, 2.0)];
    [self.layer setShadowRadius:2.0];
    [self.layer setShadowOpacity:1.0];
}




- (void)makeCircle{

    self.layer.masksToBounds = YES;
    [self setNeedsLayout];
    [self layoutIfNeeded];
    self.layer.cornerRadius = self.frame.size.height/2;
}

- (void)makeRoundedCornor{
    [self setCornorRediousRounded:kCornorRedious andBorder:NO withBorderColor:nil andBorderWidth:0];
}



- (void)setCornorRediousRounded:(CGFloat)redious andBorder:(BOOL)border withBorderColor:(UIColor *)color andBorderWidth:(CGFloat)width{

        //self.layer.masksToBounds = YES;
    self.layer.cornerRadius = redious;

    if (border) {//Set Border

        self.layer.borderWidth = width;
        self.layer.borderColor=[color CGColor];

    }

}

- (void)roundCornorsTopLeft:(BOOL)topLeft topRight:(BOOL)topRight bottomLeft:(BOOL)bottomLeft bottomRight:(BOOL)bottomRight withRedius:(float)redius{

    self.layer.masksToBounds = YES;
    self.clipsToBounds = YES;
    [self setNeedsLayout];
    [self layoutIfNeeded];

    if (topLeft || topRight || bottomLeft || bottomRight) {

        UIRectCorner cornor = 0;

        if (topLeft) cornor = cornor | UIRectCornerTopLeft;
        if (topRight) cornor = cornor | UIRectCornerTopRight;
        if (bottomLeft) cornor = cornor | UIRectCornerBottomLeft;
        if (bottomRight) cornor = cornor | UIRectCornerBottomRight;

        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:cornor cornerRadii:CGSizeMake(redius, redius)];

        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.frame = self.bounds;
        maskLayer.path = maskPath.CGPath;
        self.layer.mask = maskLayer;



    }

}

- (void)makeCardView{
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    NSInteger shadowOffsetWidth = 3;
    NSInteger shadowOffsetHeight = 3;
    UIColor *shadowColor = [UIColor blackColor];
    float shodowOpacity = 0.2;
    self.layer.cornerRadius = kCornorRedious;
    
   UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:kCornorRedious];
    self.layer.masksToBounds = NO;
    
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowOffset = CGSizeMake(shadowOffsetWidth, shadowOffsetHeight);
    self.layer.shadowOpacity = shodowOpacity;
    self.layer.shadowPath = shadowPath.CGPath;
}


- (void)createShadowIffectWithShadowSize:(float)shadowSize onTop:(BOOL)top bottom:(BOOL)bootom right:(BOOL)right andLeft:(BOOL)left{
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    float xPos = 0;
    float yPos = 0;
    float width = 0;
    float height = 0;
    
    if (left) {
        xPos = self.bounds.origin.x - shadowSize / 2;
    }else{
        xPos = self.bounds.origin.x;
    }
    
    if (top) {
        yPos = self.bounds.origin.y - shadowSize / 2;
    }else{
        yPos = self.bounds.origin.y;
    }
    
    
    if (bootom) {
        width = self.bounds.size.width + shadowSize;
    }else{
        width = self.bounds.size.width;
    }
    
    if (right)  {
        height = self.bounds.size.height + shadowSize;
    }else{
        height = self.bounds.size.height;
    }
    
    
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:CGRectMake(xPos, yPos, width, height)];
    self.layer.masksToBounds = NO;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    self.layer.shadowOpacity = 0.5f;
    self.layer.shadowPath = shadowPath.CGPath;
}

@end
