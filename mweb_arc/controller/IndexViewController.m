//
//  IndexViewController.m
//  mweb_arc
//
//  Created by lala on 16/9/21.
//  Copyright © 2016年 mawj. All rights reserved.
//

#import "IndexViewController.h"

@interface IndexViewController ()

@end

@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"IndexView present.");
    self.rpcAccount = [[RpcAccount alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnNetwork:(id)sender {
    NSLog(@"click event btnNetwork called.");
    [self.rpcAccount getAccountInfoWithParams];
}
@end
