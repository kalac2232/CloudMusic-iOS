//
//  DiscoveryMainController.m
//  cloudmusic
//
//  Created by 郭皓楠 on 2020/5/31.
//  Copyright © 2020 郭皓楠. All rights reserved.
//

#import "DiscoveryMainController.h"
#import "BannerViewCell.h"

@interface DiscoveryMainController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic, retain) UICollectionView *bannerView;
@property (nonatomic, retain) UIPageControl *pagerControl;
@property (nonatomic, retain) NSTimer *timer;
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
    searchIcon.frame = CGRectMake(49, (searchBgView.height - 22.5) /2, 22.5, 22.5);
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
    
    //计算图标与文本的位置使其居中
    searchIcon.frame = CGRectMake((searchBgView.width - (22.5+3+searchTipLabel.width)) / 2, (searchBgView.height - 22.5) /2, 22.5, 22.5);
    searchTipLabel.frame = CGRectMake(searchIcon.left+22.5+3, (searchBgView.height - searchTipLabel.height) /2, searchTipLabel.width, searchTipLabel.height);
    
    //创建banner
    //1.创建layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    layout.itemSize = CGSizeMake(SCREEN_WIDTH, 134);
    layout.minimumLineSpacing = 0;
    //2. 初始化UICollectionView
    self.bannerView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, searchBgView.frame.origin.y+searchBgView.height + 16, SCREEN_WIDTH, 134) collectionViewLayout:layout];
    self.bannerView.backgroundColor = [UIColor whiteColor];
    self.bannerView.pagingEnabled = YES;
    self.bannerView.showsHorizontalScrollIndicator = NO;//滑条不出现
    
    [self.view addSubview:self.bannerView];
    
    [self.bannerView registerClass:[BannerViewCell class] forCellWithReuseIdentifier:@"cellId"];
    
    self.bannerView.delegate = self;
    self.bannerView.dataSource = self;
    
    //设置起始位置
    [self.bannerView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:50 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];

    
    //创建UIPageControl
    self.pagerControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.bannerView.top + 122, SCREEN_WIDTH, 6)];
    [self.view addSubview:self.pagerControl];
    self.pagerControl.numberOfPages = 5;
    //创建定时器
    [self addTimer];
}

- (void)nextImage {
    //设置当前 indePath
    NSIndexPath *currrentIndexPath = [[self.bannerView indexPathsForVisibleItems]lastObject];
    NSIndexPath *currentIndexPathReset = [NSIndexPath indexPathForItem:currrentIndexPath.item inSection:0];
    [self.bannerView scrollToItemAtIndexPath:currentIndexPathReset atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    // 设置下一个滚动的item
    NSInteger nextItem = currentIndexPathReset.item + 1;

    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:0];
    [self.bannerView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}


- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    BannerViewCell *cell = (BannerViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];

    if (indexPath.row % 2) {
        cell.image.backgroundColor = [UIColor redColor];
    } else {
        cell.image.backgroundColor = [UIColor blueColor];
    }
    
    return cell;
}

// collectionView继承于scrollview 所以我们可用此方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 计算page算法
    int page = (int) (scrollView.contentOffset.x / SCREEN_WIDTH + 0.5) % 5;
    self.pagerControl.currentPage = page;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    [self removeTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    [self addTimer];
}

- (void)addTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)removeTimer{
  [self.timer invalidate];
  self.timer = nil;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}




@end
