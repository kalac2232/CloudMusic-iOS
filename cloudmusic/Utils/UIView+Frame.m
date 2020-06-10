//
//  UIView+Frame.m
//  cloudmusic
//
//  Created by 郭皓楠 on 2020/6/10.
//  Copyright © 2020 郭皓楠. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

-(CGFloat)left
{
    return self.frame.origin.x;
}

-(CGFloat)top
{
    return self.frame.origin.y;
}

-(CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

-(CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

-(CGFloat)width
{
    return self.frame.size.width;
}

-(CGFloat)height
{
    return self.frame.size.height;
}

@end
