//
//  NSLayoutConstraint+ZBAdapter.m
//  ZBFontAdapter
//
//  Created by 张波 on 2019/5/27.
//  Copyright © 2019 张波. All rights reserved.
//

#import "NSLayoutConstraint+ZBAdapter.h"
#import "ZBKit_DefineCommon.h"

@implementation NSLayoutConstraint (ZBAdapter)

- (CGFloat)originConstant
{
	return [ZBKit_Objc_getObj floatValue];
}

- (void)setOriginConstant:(CGFloat)originConstant
{
	ZBKit_Objc_setObj(@selector(originConstant), @(originConstant));
}

@end
