//  weibo: http://weibo.com/xiaoqing28
//  blog:  http://www.alonemonkey.com
//
//  AwesomeDylib.m
//  AwesomeDylib
//
//  Created by zhuyongqing on 2018/1/24.
//  Copyright (c) 2018年 zhuyongqing. All rights reserved.
//

#import "AwesomeDylib.h"
#import <CaptainHook/CaptainHook.h>
#import <UIKit/UIKit.h>
#import <Cycript/Cycript.h>
#import "NSLogger.h"
static __attribute__((constructor)) void entry(){
    NSLog(@"\n               🎉!!！congratulations!!！🎉\n👍----------------insert dylib success----------------👍");
    
    LoggerSetViewerHost(NULL, (__bridge CFStringRef)@"你的IP", (UInt32)50000);
    
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        
        CYListenServer(6666);
    }];
}

CHDeclareClass(HTSGLFilter)
CHOptimizedMethod(1, self,id,HTSGLFilter,initWithFragmentShaderFromString,NSString *,arg2){
    LogMessage(@"filter", 1, arg2);
    return CHSuper(1, HTSGLFilter,initWithFragmentShaderFromString,arg2);
}

CHConstructor{
    CHLoadLateClass(HTSGLFilter);
    CHHook(1,HTSGLFilter,initWithFragmentShaderFromString);
}

