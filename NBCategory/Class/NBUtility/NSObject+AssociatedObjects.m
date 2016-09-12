//
//  NSObject+AssociatedObjects.m
//  NBCategory
//
//  Created by 刘彬 on 16/3/15.
//  Copyright © 2016年 NewBee. All rights reserved.
//

#import "NSObject+AssociatedObjects.h"
#import <objc/runtime.h>

@implementation NSObject (AssociatedObjects)

- (void)associateStrongNonatomicObject:(id)object withKey:(const void *)key {
    objc_setAssociatedObject(self, key, object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)associateStrongAtomicObject:(id)object withKey:(const void *)key {
    objc_setAssociatedObject(self, key, object, OBJC_ASSOCIATION_RETAIN);
}

- (void)associateCopyNonatomicObject:(id)object withKey:(const void *)key {
    objc_setAssociatedObject(self, key, object, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)associateCopyAtomicObject:(id)object withKey:(const void *)key {
    objc_setAssociatedObject(self, key, object, OBJC_ASSOCIATION_COPY);
}

- (void)associateWeakObject:(id)object withKey:(const void *)key {
    objc_setAssociatedObject(self, key, object, OBJC_ASSOCIATION_ASSIGN);
}

- (id)associatedObjectForKey:(const void *)key {
    return objc_getAssociatedObject(self, key);
}

- (void)removeAllAssociatedObjects {
    objc_removeAssociatedObjects(self);
}


+ (void)associateStrongNonatomicObject:(id)object withKey:(const void *)key {
    objc_setAssociatedObject(self, key, object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)associateStrongAtomicObject:(id)object withKey:(const void *)key {
    objc_setAssociatedObject(self, key, object, OBJC_ASSOCIATION_RETAIN);
}

+ (void)associateCopyNonatomicObject:(id)object withKey:(const void *)key {
    objc_setAssociatedObject(self, key, object, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

+ (void)associateCopyAtomicObject:(id)object withKey:(const void *)key {
    objc_setAssociatedObject(self, key, object, OBJC_ASSOCIATION_COPY);
}

+ (void)associateWeakObject:(id)object withKey:(const void *)key {
    objc_setAssociatedObject(self, key, object, OBJC_ASSOCIATION_ASSIGN);
}

+ (id)associatedObjectForKey:(const void *)key {
    return objc_getAssociatedObject(self, key);
}

+ (void)removeAllAssociatedObjects {
    objc_removeAssociatedObjects(self);
}

@end
