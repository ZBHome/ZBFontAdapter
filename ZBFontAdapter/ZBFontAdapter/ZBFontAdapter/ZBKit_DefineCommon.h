//
//  ZBKit_DefineCommon.h
//  ZBAdapter
//
//  Created by 张波 on 2019/5/27.
//  Copyright © 2019 张波. All rights reserved.
//

#ifndef ZBKit_DefineCommon_h
#define ZBKit_DefineCommon_h

#import <objc/runtime.h>

#define mark - scale
#define ZBKit_Scale  ([UIScreen mainScreen].bounds.size.width / 375.0)

#pragma mark - runtime
/*! runtime set */
#define ZBKit_Objc_setObj(key, value) objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC)

/*! runtime setCopy */
#define ZBKit_Objc_setObjCOPY(key, value) objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_COPY)

/*! runtime get */
#define ZBKit_Objc_getObj objc_getAssociatedObject(self, _cmd)

/*! runtime exchangeMethod */
#define ZBKit_Objc_exchangeMethodAToB(originalSelector,swizzledSelector) { \
Method originalMethod = class_getInstanceMethod(self, originalSelector); \
Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector); \
if (class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) { \
class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod)); \
} else { \
method_exchangeImplementations(originalMethod, swizzledMethod); \
} \
}

#endif /* ZBKit_DefineCommon_h */
