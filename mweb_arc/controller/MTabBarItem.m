//
//  MTabBarItem.m
//  mweb_arc
//
//  Created by lala on 16/9/7.
//  Copyright © 2016年 mawj. All rights reserved.
//

#import "MTabBarItem.h"

@implementation MTabBarItem


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {

        UIImage *rawImage = [self.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *rawSelectedImage = [self.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [self setSelectedImage:rawSelectedImage];
        [self setImage:rawImage];
        
        NSLog(@"你好%d",[self tag]);
        
        if([self tag] == 1){
            NSLog(@"bingo");
            //set selected text color
            [self setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:12.0F], NSForegroundColorAttributeName:        [UIColor brownColor]} forState:UIControlStateSelected];
            
            //set unselect text color
            [self setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12.0F],  NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateNormal];
        }

    }
    return self;
}

@end
