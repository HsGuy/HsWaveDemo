//
//  ViewController.m
//  HsWaveDemo
//
//  Created by dcpSsss on 16/8/25.
//  Copyright © 2016年 dcpSsss. All rights reserved.
//

#import "ViewController.h"
#import "HsWave.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    HsWave *wave = [[HsWave alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 300)];
    wave.backgroundColor = [UIColor redColor];
    wave.maskWaveColor = [UIColor blueColor];
    [self.view addSubview:wave];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
