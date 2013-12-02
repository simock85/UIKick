//
//  UKView.m
//  UIKick
//
//  Created by Simone Marzola on 15/11/13.
//  Copyright (c) 2013 Simock85. All rights reserved.
//

#import "UKView.h"
#import "UKColor.h"
#import <QuartzCore/QuartzCore.h>

@implementation UKView

+ (void)roundCorners:(UIRectCorner)corners ofView:(UIView *)view withCornerRadius:(CGFloat)radius{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds
                                                   byRoundingCorners:corners
                                                         cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = view.bounds;
    maskLayer.path = maskPath.CGPath;
    view.layer.mask = maskLayer;
}

+ (void)roundAllCornersOfView:(UIView *)view withCornerRadius:(CGFloat)radius{
    [self roundCorners:UIRectCornerAllCorners ofView:view withCornerRadius:radius];
}

+ (void)addShadowToView:(UIView *)view withOffset:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius color:(id)color{
    UIColor *actualColor = [UKColor actualColorOrColorFromCache:color];
    view.layer.shadowColor = actualColor.CGColor;
    view.layer.shadowOffset = offset;
    view.layer.shadowRadius = radius;
    view.layer.shadowOpacity = opacity;
}

+ (void)addLighterShadowToView:(UIView *)view withOffset:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius{
    UIColor *actualColor = [UKColor lightColorFromColor:view.backgroundColor];
    [self addShadowToView:view withOffset:offset opacity:opacity radius:radius color:actualColor];
}

+ (void)addDarkerShadowToView:(UIView *)view withOffset:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius{
    UIColor *actualColor = [UKColor darkColorFromColor:view.backgroundColor];
    [self addShadowToView:view withOffset:offset opacity:opacity radius:radius color:actualColor];
}

@end
