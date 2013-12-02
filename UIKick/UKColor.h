//
//  UKColor.h
//  UIKick
//
//  Created by Simone Marzola on 10/11/13.
//  Copyright (c) 2013 Simock85. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UKColor : NSObject

+ (NSMutableDictionary*)colorCache;
+ (UIColor*)actualColorOrColorFromCache:(id)color;
+ (void)setFirstStepBrightnessMultiplier:(CGFloat)multiplier;
+ (void)setSecondStepBrightnessMultiplier:(CGFloat)multiplier;
+ (UIColor*)color:(id)color withBrightnessMultiplier:(CGFloat)multiplier;
+ (UIColor*)lightColorFromColor:(id)color;
+ (UIColor*)lighterColorFromColor:(id)color;
+ (UIColor*)darkColorFromColor:(id)color;
+ (UIColor*)darkerColorFromColor:(id)color;

@end
