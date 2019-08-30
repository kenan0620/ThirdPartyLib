//
//  SDWebimageParseVC.m
//  ThirdPartyLib
//
//  Created by conan on 2019/8/30.
//  Copyright © 2019年 conan. All rights reserved.
//

#import "SDWebimageParseVC.h"

#import <SDWebImage/SDWebImage.h>
#import <Masonry/Masonry.h>
@interface SDWebimageParseVC ()
@property (nonatomic, strong) UIImageView *testImageView;
@end

@implementation SDWebimageParseVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.testImageView];
    [self.testImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.height.equalTo(@100);
    }];
    [self loadImage];
}


- (void)loadImage{
    //加载图片方式
    [self.testImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",@"https://camo.githubusercontent.com/1560be050811ab73457e90aee62cd1cd257c7fb9/68747470733a2f2f7261772e6769746875622e636f6d2f41464e6574776f726b696e672f41464e6574776f726b696e672f6173736574732f61666e6574776f726b696e672d6c6f676f2e706e67"]] placeholderImage:[UIImage imageNamed:@"defaultImage"] options:SDWebImageHighPriority context:@{} progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        NSLog(@"进度");
    } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        NSLog(@"完成");
    }];
    /**
    共有下面几种设置方法，简单介绍一下

     url：图片的url地址
     placeholder：默认占位图
     options：图片的加载方式，采用位运算的形式，进行多种选择
     context：以 SDWebImageContextOption为key、id(指定类型或者协议)为value
     progress:(nullable SDImageLoaderProgressBlock)progressBlock
     completed:(nullable SDExternalCompletionBlock)completedBlock;
     
     采用组合方式，组合了以下几种

     - (void)sd_setImageWithURL:(nullable NSURL *)url NS_REFINED_FOR_SWIFT;

    - (void)sd_setImageWithURL:(nullable NSURL *)url
    placeholderImage:(nullable UIImage *)placeholder NS_REFINED_FOR_SWIFT;

    - (void)sd_setImageWithURL:(nullable NSURL *)url
    placeholderImage:(nullable UIImage *)placeholder
    options:(SDWebImageOptions)options NS_REFINED_FOR_SWIFT;

    - (void)sd_setImageWithURL:(nullable NSURL *)url
    placeholderImage:(nullable UIImage *)placeholder
    options:(SDWebImageOptions)options
    context:(nullable SDWebImageContext *)context;

    - (void)sd_setImageWithURL:(nullable NSURL *)url
    completed:(nullable SDExternalCompletionBlock)completedBlock;

    - (void)sd_setImageWithURL:(nullable NSURL *)url
    placeholderImage:(nullable UIImage *)placeholder
    completed:(nullable SDExternalCompletionBlock)completedBlock NS_REFINED_FOR_SWIFT;

    - (void)sd_setImageWithURL:(nullable NSURL *)url
    placeholderImage:(nullable UIImage *)placeholder
    options:(SDWebImageOptions)options
    completed:(nullable SDExternalCompletionBlock)completedBlock;

    - (void)sd_setImageWithURL:(nullable NSURL *)url
    placeholderImage:(nullable UIImage *)placeholder
    options:(SDWebImageOptions)options
    progress:(nullable SDImageLoaderProgressBlock)progressBlock
    completed:(nullable SDExternalCompletionBlock)completedBlock;

    - (void)sd_setImageWithURL:(nullable NSURL *)url
    placeholderImage:(nullable UIImage *)placeholder
    options:(SDWebImageOptions)options
    context:(nullable SDWebImageContext *)context
    progress:(nullable SDImageLoaderProgressBlock)progressBlock
    completed:(nullable SDExternalCompletionBlock)completedBlock;
    
     */

}
- (UIImageView *)testImageView{
    if (!_testImageView) {
        _testImageView = [[UIImageView alloc]init];
    }
    return _testImageView;
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

@end
