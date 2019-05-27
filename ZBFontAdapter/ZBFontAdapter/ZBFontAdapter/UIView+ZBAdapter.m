//
//  UIView+ZBAdapter.m
//  ZBFontAdapter
//
//  Created by 张波 on 2019/5/27.
//  Copyright © 2019 张波. All rights reserved.
//

#import "UIView+ZBAdapter.h"
#import "ZBKit_DefineCommon.h"
#import "NSLayoutConstraint+ZBAdapter.h"

@implementation UIView (ZBAdapter)

+ (void)load
{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		ZBKit_Objc_exchangeMethodAToB(@selector(awakeFromNib), @selector(zb_awakeFromNib));
	});
}

/*! 当控件是从xib、storyboard中创建时，会先调用initWithCoder:这个方法，再调用awakeFromNib方法 */
- (instancetype)zb_awakeFromNib
{
	[self zb_awakeFromNib];
	if (self)
	{
		dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
			[self zb_viewSubviewsAdapter];
		});
	}
	return self;
}

/*! 适配控件大小 */
- (void)zb_viewSubviewsAdapter
{
	[self zb_viewConstraintsAdapter];
	dispatch_async(dispatch_get_main_queue(), ^{
		[self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull view, NSUInteger idx, BOOL * _Nonnull stop) {
			[view zb_viewConstraintsAdapter];
			[view zb_viewSubviewsAdapter];
		}];
	});
}

- (void)zb_viewConstraintsAdapter
{
	dispatch_async(dispatch_get_main_queue(), ^{
		[self.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull constraint, NSUInteger idx, BOOL * _Nonnull stop) {
			if (constraint.identifier.length > 0 && constraint.originConstant <= 0) {
				constraint.originConstant = constraint.constant;
				constraint.constant = constraint.originConstant * ZBKit_Scale;
			}
		}];
	});
}

@end
