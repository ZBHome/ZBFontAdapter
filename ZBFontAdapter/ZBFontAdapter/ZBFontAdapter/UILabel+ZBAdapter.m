//
//  UILabel+ZBAdapter.m
//  ZBFontAdapter
//
//  Created by 张波 on 2019/5/27.
//  Copyright © 2019 张波. All rights reserved.
//

#import "UILabel+ZBAdapter.h"
#import "ZBKit_DefineCommon.h"

@implementation UILabel (ZBAdapter)

+ (void)load
{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		ZBKit_Objc_exchangeMethodAToB(@selector(initWithFrame:), @selector(zb_initWithFrame:));
		ZBKit_Objc_exchangeMethodAToB(@selector(initWithCoder:), @selector(zb_initWithCoder:));
	});
}

/*! 当控件不是从xib、storyboard中创建时，会调用initWithFrame:这个方法 */
- (instancetype)zb_initWithFrame:(CGRect)frame
{
	[self zb_initWithFrame:frame];
	if (self)
	{
		[self zb_adapter];
	}
	return self;
}

/*! 当控件是从xib、storyboard中创建时，会先调用initWithCoder:这个方法，再调用awakeFromNib方法 */
- (instancetype)zb_initWithCoder:(NSCoder *)aDecoder
{
	[self zb_initWithCoder:aDecoder];
	if (self)
	{
		[self zb_adapter];
	}
	return self;
}

/*! 适配字体大小 */
- (void)zb_adapter
{
	/*! 部分不想修改字体大小的，可以把tag值设置成999 */
	if (self.tag != 999)
	{
		self.font = [UIFont fontWithName:self.font.fontName size:self.font.pointSize * ZBKit_Scale];
	}
}

@end
