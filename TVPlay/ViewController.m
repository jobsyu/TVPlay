//
//  ViewController.m
//  TVPlay
//
//  Created by jobs on 15/7/21.
//  Copyright (c) 2015年 jobs. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import "MoviePlayerVIewController.h"

@interface ViewController ()<MoviePlayerVIewControllerDelegate>
@property (weak,nonatomic) IBOutlet UIImageView *imgView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    MoviePlayerVIewController *movieVc =[[MoviePlayerVIewController alloc] init];
    movieVc.movieURL = [[NSBundle mainBundle] URLForResource:@"promo_full.mp4" withExtension:nil];
    
    movieVc.captureTimes = @[@(1.0),@(6.0)];
    
    movieVc.delegate =self;
    
    [self presentViewController:movieVc animated:YES completion:nil];
}

-(void)moviePlayerViewController:(MoviePlayerVIewController *)vc didFinishCapturedImage:(UIImage *)image
{
    //显示截图
    self.imgView.image = image;
}

@end
