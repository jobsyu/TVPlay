//
//  MoviePlayerVIewController.m
//  TVPlay
//
//  Created by jobs on 15/7/21.
//  Copyright (c) 2015年 jobs. All rights reserved.
//

#import "MoviePlayerVIewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface MoviePlayerVIewController()

@property (nonatomic,strong) MPMoviePlayerController *modelContr;

@end

@implementation MoviePlayerVIewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    //断言
    NSAssert(self.movieURL !=nil, @"请先设置movieURL");
    
    //初始化一个视频播放器
    MPMoviePlayerController *movieContr = [[MPMoviePlayerController alloc] initWithContentURL:self.movieURL];
    
    movieContr.view.frame = self.view.bounds;
    
    movieContr.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    [self.view addSubview:movieContr.view];
    
    //
    [movieContr prepareToPlay];
    
    [movieContr play];
    
    self.modelContr = movieContr;
    
    //监听Done事件
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(exit) name:MPMoviePlayerDidExitFullscreenNotification object:nil];
    
    //监听视频播放完成
    [center addObserver:self selector:@selector(exit) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    //设置时间
    if (self.captureTimes) {
        [self.modelContr requestThumbnailImagesAtTimes:self.captureTimes timeOption:MPMovieTimeOptionExact];
    }
    
    //监听截屏返回图片
    [center addObserver:self selector:@selector(captureTimes:) name:MPMoviePlayerThumbnailImageRequestDidFinishNotification object:nil];
}

#pragma mark 获取截图
-(void)captureTimes:(NSNotification *)noti
{
    NSLog(@"%@",noti.userInfo);
    
    //通知代理
    if ([self.delegate respondsToSelector:@selector(moviePlayerViewController:didFinishCapturedImage:)]) {
        UIImage *img = noti.userInfo[MPMoviePlayerThumbnailImageKey];
        [self.delegate moviePlayerViewController:self didFinishCapturedImage:img];
    }
}

#pragma mark 退出
-(void)exit
{
    NSLog(@"%s",__func__);
    
    //退出
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
