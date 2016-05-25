//
//  ViewController.m
//  iOSCoverFlow
//
//  Created by 吕建发 on 16/5/25.
//  Copyright © 2016年 cn.geek. All rights reserved.
//

#import "ViewController.h"
#import "GLCell.h"


#define GLCount 50

@interface ViewController () <UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return GLCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // 1. 创建Cell
    GLCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"blue_cell" forIndexPath:indexPath];
    
    
    // 把当前的item的索引，以及总的个数传递给cell
    [cell setIndexPath:indexPath withCount:GLCount];
    
    
    
    // 2. 返回Cell
    return cell;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    HMCoverFlowLayout * flow = [[HMCoverFlowLayout alloc] init];
//    
//    flow.minimumInteritemSpacing = -10;
    
    
    self.collectionView.delegate = self;
    
    
}


- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    [self scrollViewDidScroll:self.collectionView];

}


#pragma mark - didScorll

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    

    // 坐标系转换获得collectionView上面的位于中心的cell
    CGPoint pointInView = [self.view convertPoint:self.collectionView.center toView:self.collectionView];
    // 获取这一点的indexPath
    NSIndexPath *indexPathNow = [self.collectionView indexPathForItemAtPoint:pointInView];
    
    
    
        GLCell *cell = (GLCell *)[self.collectionView cellForItemAtIndexPath:indexPathNow];

    
    [self.collectionView bringSubviewToFront:cell];
 
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    


}

@end
