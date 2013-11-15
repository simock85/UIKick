//
//  UIColor+UIKick.h
//  UIKick
//
//  Created by Simone Marzola on 15/11/13.
//  Copyright (c) 2013 Simock85. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (UIKick)

+ (UIColor *)cachedColorForKey:(NSString*)key;
+ (void)setCachedColor:(UIColor*)color forKey:(NSString*)key;

- (UIColor*)lightColor;
- (UIColor*)lighterColor;
- (UIColor*)darkColor;
- (UIColor*)darkerColor;
- (UIColor*)colorWithBrightnessMultiplier:(CGFloat)multiplier;

@end
