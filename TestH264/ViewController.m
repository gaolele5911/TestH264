//
//  ViewController.m
//  TestH264
//
//  Created by gaol on 2018/6/7.
//  Copyright © 2018年 gaol. All rights reserved.
//


#import "ViewController.h"
#import "testH264.h"

@interface ViewController ()
@property (nonatomic, strong) NSTimer *timer1;
@property (weak, nonatomic) IBOutlet UIImageView *gitImage;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UIButton *startRecordScreen;

@property (weak,nonatomic) testH264 * mTestH264;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //时间
    NSDate *date = [NSDate date];
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"MM月dd日 HH:mm:ss"];
    NSString *timeString = [dateFormatter stringFromDate:date];
    _date.text=timeString;
    [_date sizeToFit];
    
    if(!_timer1){
        _timer1=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(addLaunchertime) userInfo:nil repeats:YES];
        NSRunLoop *runloop = [NSRunLoop currentRunLoop];
        [runloop addTimer:_timer1 forMode:NSRunLoopCommonModes];
    }

    [self animationImageView:_gitImage];
    
    _startRecordScreen.tag = 0;
    [_startRecordScreen setTitle:@"Start Record Screen" forState:UIControlStateNormal];
    [_startRecordScreen sizeToFit];
    
    _mTestH264 = [testH264 sharedInstance];
}

//时钟模块
- (void)addLaunchertime
{
    //时间
    NSDate *date = [NSDate date];
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"MM月dd日 HH:mm:ss"];
    NSString *timeString = [dateFormatter stringFromDate:date];
    _date.text=timeString;
    [_date sizeToFit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)animationImageView:(UIImageView *)imageView1
{
    // UIImageView动画（播放序列图）
    // 1.将序列图加入数组
    NSMutableArray *imagesArray = [[NSMutableArray alloc] init];
    for(int i=1;i<=10;i++)
    {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"abc%d.jpg",i]];
        [imagesArray addObject:image];
    }
    //    UIImageView *imageView1 = [[UIImageView alloc] init];
    //    imageView1.frame = CGRectMake(10, 200, 300, 217);
    imageView1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:imageView1];
    // 设置序列图数组
    imageView1.animationImages = imagesArray;
    // 设置播放周期时间
    imageView1.animationDuration = 2;
    // 设置播放次数
    imageView1.animationRepeatCount = 0;
    // 播放动画
    [imageView1 startAnimating];
    //    [imageView1 stopAnimating];
    
}
-(void)dealloc {
    if (_timer1) {
        if ([self.timer1 isValid]) {
            [self.timer1 invalidate];
            _timer1=nil;
        }
    }
}
- (IBAction)isStartRecordScreen:(id)sender {
    
    if (_startRecordScreen.tag == 0) {
        
        [_mTestH264 startRecord];
        _startRecordScreen.tag =1;
        [_startRecordScreen setTitle:@"Stop Record Screen" forState:UIControlStateNormal];
        [_startRecordScreen sizeToFit];
    }
    else {
        [_mTestH264 stopReord];
        _startRecordScreen.tag =0;
        [_startRecordScreen setTitle:@"Start Record Screen" forState:UIControlStateNormal];
        [_startRecordScreen sizeToFit];
    }
}

@end

