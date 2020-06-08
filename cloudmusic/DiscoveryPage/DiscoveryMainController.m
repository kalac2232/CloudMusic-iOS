//
//  DiscoveryMainController.m
//  cloudmusic
//
//  Created by 郭皓楠 on 2020/5/31.
//  Copyright © 2020 郭皓楠. All rights reserved.
//

#import "DiscoveryMainController.h"
#import "UIColor+Hex.h"

@interface DiscoveryMainController ()

@end

@implementation DiscoveryMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
    
}

- (void)initView{
    //听歌识曲图标
    UIImageView *recMusicBtn = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nav_icn_music"]];
    recMusicBtn.frame = CGRectMake(16, State_Bar_H + (kNavigationBarHeight - 28) / 2, 28, 28);
    [self.view addSubview:recMusicBtn];
    //搜索圆角背景框
    UIView *searchBgView = [[UIView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 260 )/2, State_Bar_H + (kNavigationBarHeight - 36), 260, 36)];
    searchBgView.backgroundColor = [UIColor colorWithHexString:@"#F7F7F7"];
    searchBgView.layer.cornerRadius = 18;
    [self.view addSubview:searchBgView];
    //搜索小图标
    UIImageView *searchIcon = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"nav_search"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    searchIcon.frame = CGRectMake(49, (searchBgView.frame.size.height - 22.5) /2, 22.5, 22.5);
    searchIcon.tintColor = [UIColor colorWithHexString:@"#949595"];
    [searchBgView addSubview:searchIcon];
    //搜索框中的文本
    UILabel *searchTipLabel = [[UILabel alloc] init];
    searchTipLabel.textColor = [UIColor colorWithHexString:@"#C6C6C6"];
    searchTipLabel.font = [UIFont systemFontOfSize:14];
    searchTipLabel.text = @"Collide - Jake Miller";
    searchTipLabel.numberOfLines = 0;
    [searchTipLabel sizeToFit];
    [searchBgView addSubview:searchTipLabel];
    UIPageControl
    
    searchIcon.frame = CGRectMake((searchBgView.frame.size.width - (22.5+3+searchTipLabel.frame.size.width)) / 2, (searchBgView.frame.size.height - 22.5) /2, 22.5, 22.5);
    searchTipLabel.frame = CGRectMake(searchIcon.frame.origin.x+22.5+3, (searchBgView.frame.size.height - searchTipLabel.frame.size.height) /2, searchTipLabel.frame.size.width, searchTipLabel.frame.size.height);
    
    NSLog(@"label width:%f",searchTipLabel.frame.size.width);
}



@end
