//
//  UKView.h
//  UIKick
//
//  Created by Simone Marzola on 15/11/13.
//  Copyright (c) 2013 Simock85. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UKView : NSObject

+ (void)roundCorners:(UIRectCorner)corners ofView:(UIView*)view withCornerRadius:(CGFloat)radius;
+ (void)roundAllCornersOfView:(UIView*)view withCornerRadius:(CGFloat)radius;

+ (void)addShadowToView:(UIView*)view withOffset:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius color:(id)color;
+ (void)addLighterShadowToView:(UIView*)view withOffset:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius;
+ (void)addDarkerShadowToView:(UIView*)view withOffset:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius;

@end
