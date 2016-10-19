//
//  ViewController.m
//  mweb_arc
//
//  Created by lala on 16/9/7.
//  Copyright © 2016年 mawj. All rights reserved.
//

#import "ViewController.h"

#define SCREEN_FRAME ([[UIScreen mainScreen] bounds])
#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT  ([UIScreen mainScreen].bounds.size.height)


@interface ViewController (){
    UIPageControl *pageControl;
    UIScrollView *scrollView;
    UIImageView *imageViewOne;
    UIImageView *imageViewTwo;
    UIImageView *imageViewThree;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //init ui
    scrollView = [[UIScrollView alloc] initWithFrame:SCREEN_FRAME];
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*3, SCREEN_HEIGHT);
    scrollView.pagingEnabled = YES;
    scrollView.scrollEnabled = YES;
    scrollView.bounces = NO;
    scrollView.delegate = self;
    scrollView.showsHorizontalScrollIndicator = FALSE;
    [self.view addSubview:scrollView];
    
    pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0,SCREEN_HEIGHT-50,SCREEN_WIDTH,10)];
    pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:0.153 green:0.533 blue:0.76 alpha:1.0];
    [self.view addSubview:pageControl];
    pageControl.numberOfPages = 3;
    
    [self createViewOne];
    [self createViewTwo];
    [self createViewThree];
    
}

- (void)createViewOne {
    UIView *view = [[UIView alloc] initWithFrame:SCREEN_FRAME];
    
    imageViewOne = [[UIImageView alloc] initWithFrame:SCREEN_FRAME];
    imageViewOne.contentMode = UIViewContentModeScaleAspectFill;
    imageViewOne.image = [UIImage imageNamed:@"splash1"];
    [view addSubview:imageViewOne];
    
    UITapGestureRecognizer *singleTap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(splashPress1:)];
    imageViewOne.userInteractionEnabled = YES;
    [imageViewOne addGestureRecognizer:(singleTap1)];
    [scrollView addSubview:view];
    
}

- (void)createViewTwo {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
    imageViewTwo = [[UIImageView alloc] initWithFrame:SCREEN_FRAME];
    imageViewTwo.contentMode = UIViewContentModeScaleAspectFill;
    imageViewTwo.image = [UIImage imageNamed:@"splash2"];
    [view addSubview:imageViewTwo];
    
    UITapGestureRecognizer *singleTap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(splashPress2:)];
    imageViewTwo.userInteractionEnabled = YES;
    [imageViewTwo addGestureRecognizer:(singleTap2)];
    [scrollView addSubview:view];
    
}

- (void)createViewThree {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*2, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
    imageViewThree = [[UIImageView alloc] initWithFrame:SCREEN_FRAME];
    imageViewThree.contentMode = UIViewContentModeScaleAspectFill;
    imageViewThree.image = [UIImage imageNamed:@"splash3"];
    [view addSubview:imageViewThree];
    
    
    UITapGestureRecognizer *singleTap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(splashPress3:)];
    imageViewThree.userInteractionEnabled = YES;
    [imageViewThree addGestureRecognizer:(singleTap3)];
    
    //enter button
    UIImageView *enterBtn = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"splash_enter_btn"]];
    
    NSLog(@"enterBtn width is %f,and height is %f",enterBtn.bounds.size.width,enterBtn.bounds.size.height);
    enterBtn.frame = CGRectMake(SCREEN_WIDTH/2-enterBtn.bounds.size.width/2, SCREEN_HEIGHT-100, enterBtn.bounds.size.width, enterBtn.bounds.size.height);
    [view addSubview:enterBtn];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(enter:)];
    enterBtn.userInteractionEnabled = YES;
    [enterBtn addGestureRecognizer:(singleTap)];
    
    [scrollView addSubview:view];
}

- (void)splashPress1:(id)sender {
    CGFloat pageWidth = CGRectGetWidth(self.view.bounds);
    CGPoint scrollPoint = CGPointMake(pageWidth, 0);
    [scrollView setContentOffset:scrollPoint animated:YES];
    pageControl.currentPage = 1;
}

- (void)splashPress2:(id)sender {
    CGFloat pageWidth = CGRectGetWidth(self.view.bounds);
    CGPoint scrollPoint = CGPointMake(pageWidth*2, 0);
    [scrollView setContentOffset:scrollPoint animated:YES];
    pageControl.currentPage = 2;
}

- (void)splashPress3:(id)sender {
    NSLog(@"guard completed.");
}

- (void)enter:(id)sender {
    NSLog(@"enter button pressed.");
    //enter system :mainTabbar
    UITabBarController *mController = [self.storyboard instantiateViewControllerWithIdentifier:@"mainTabbar"];
    [self presentModalViewController:mController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint offset = scrollView.contentOffset;
    pageControl.currentPage = offset.x/SCREEN_WIDTH;
}

@end
