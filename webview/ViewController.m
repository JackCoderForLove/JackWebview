//
//  ViewController.m
//  webview
//
//  Created by 李策 on 16/2/23.
//  Copyright © 2016年 www.jack.yasn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate,UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView * web = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:web];
    NSString * path = [[NSBundle mainBundle]bundlePath];
   path =  [path stringByAppendingPathComponent:@"/活动说明/demo.html"];
    NSLog(@"%@",path);
    
    NSURL* url = [NSURL fileURLWithPath:path];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    web.scrollView.delegate = self;
    web.delegate = self;
    [web loadRequest:request];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"----%f",scrollView.contentOffset.y);
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"%@",error);
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"开始");
    return YES;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"完成");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
