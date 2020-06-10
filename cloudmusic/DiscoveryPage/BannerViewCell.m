//
//  BannerViewCell.m
//  cloudmusic
//
//  Created by 郭皓楠 on 2020/6/9.
//  Copyright © 2020 郭皓楠. All rights reserved.
//

#import "BannerViewCell.h"

@implementation BannerViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [[UIImageView alloc] initWithFrame:CGRectMake(16, 0, self.contentView.frame.size.width - 32, self.contentView.frame.size.height)];
        self.image.layer.cornerRadius = 8;
        [self.contentView addSubview:self.image];

    }
    return self;
}

@end
