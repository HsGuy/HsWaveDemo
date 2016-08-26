//
//  HsWave.h
//  HsWaveDemo
//
//  Created by dcpSsss on 16/8/25.
//  Copyright © 2016年 dcpSsss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HsWave : UIView

@property(nonatomic,assign)CGFloat waveHeight;

@property(nonatomic,strong)UIColor *waveColor;

@property(nonatomic,strong)UIColor *maskWaveColor;

@property(nonatomic,assign)CGFloat waveCurvature;

@property(nonatomic,assign)CGFloat waveSpeed;


@end
