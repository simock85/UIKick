//
//  UIColor+UIKick.m
//  UIKick
//
//  Created by Simone Marzola on 15/11/13.
//  Copyright (c) 2013 Simock85. All rights reserved.
//

#import "UIColor+UIKick.h"
#import "UKColor.h"

@implementation UIColor (UIKick)

+ (UIColor*)cachedColorForKey:(NSString *)key{
    return UKColor.colorCache[key];
}

+ (void)setCachedColor:(UIColor *)color forKey:(NSString *)key{
    UKColor.colorCache[key] = color;
}

- (UIColor*)lightColor{
    return [UKColor lightColorFromColor:self];
}

- (UIColor*)lighterColor{
    return [UKColor lighterColorFromColor:self];
}

- (UIColor*)darkColor{
    return [UKColor darkColorFromColor:self];
}


- (UIColor*)darkerColor{
    return [UKColor darkerColorFromColor:self];
}

- (UIColor*)colorWithBrightnessMultiplier:(CGFloat)multiplier{
    return [UKColor color:self withBrightnessMultiplier:multiplier];
}

@end
