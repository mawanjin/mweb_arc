//
//  IndexViewController.h
//  mweb_arc
//
//  Created by lala on 16/9/21.
//  Copyright © 2016年 mawj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RpcAccount.h"

@interface IndexViewController : UIViewController

@property (nonatomic,strong) RpcAccount *rpcAccount;

- (IBAction)btnNetwork:(id)sender;

@end
