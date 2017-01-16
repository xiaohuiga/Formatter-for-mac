//
//  ViewController.m
//  Formatter
//
//  Created by Minghui Sun on 2017/1/12.
//  Copyright © 2017年 Teplot. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSTextView *textV;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //先获取到文本信息，然后
    textV = [[NSTextView alloc] init];
    
    
    textV.frame = CGRectMake(0, 200, 450, 100000000);
    
    textV.string = @"在此输入你的数据。必须是json数据哦";
    
    [self.view addSubview:textV];
    

    NSButton *btn = [NSButton buttonWithTitle:@"生成" target:self action:@selector(resultAction)];
    
    btn.frame = CGRectMake(100, CGRectGetMaxY(textV.frame)+20, 60, 30);
    [self.view addSubview:btn];
    
    NSLog(@"桌面地址：%@",[NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES) lastObject]);
}

- (void)resultAction {
    
    //桌面地址
    NSString *desktopPath = [NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES) lastObject];
    
    NSString *json = textV.string;
    
    NSData *data = [json dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    //将dic转为plist文件
    [dic writeToFile:[desktopPath stringByAppendingPathComponent:@"temp.plist"] atomically:YES];
    
    
    NSAlert *alert = [[NSAlert alloc] init];
    [alert addButtonWithTitle:@"确定"];
    [alert setMessageText:@"文件已经生成，请在桌面查看"];
    [alert runModal];
    
    
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
