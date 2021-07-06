//
//  WJViewController.m
//  CrashHook
//
//  Created by 2576175431@qq.com on 06/23/2021.
//  Copyright (c) 2021 2576175431@qq.com. All rights reserved.
//

#import "WJViewController.h"

@interface WJViewController ()

- (void)push;

@end

@implementation WJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self push];//测试方法没实现的crash
}

@end
