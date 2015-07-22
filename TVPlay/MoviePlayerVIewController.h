//
//  MoviePlayerVIewController.h
//  TVPlay
//
//  Created by jobs on 15/7/21.
//  Copyright (c) 2015年 jobs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MoviePlayerVIewController;
@protocol MoviePlayerVIewControllerDelegate <NSObject>

-(void)moviePlayerViewController:(MoviePlayerVIewController *)vc didFinishCapturedImage:(UIImage *)image;
@end

@interface MoviePlayerVIewController : UIViewController

@property (nonatomic,strong) NSURL *movieURL;

@property (nonatomic,strong) NSArray *captureTimes;

@property (weak,nonatomic) id<MoviePlayerVIewControllerDelegate> delegate;

@end
