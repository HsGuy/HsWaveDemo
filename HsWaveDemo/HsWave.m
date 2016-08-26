//
//  HsWave.m
//  HsWaveDemo
//
//  Created by dcpSsss on 16/8/25.
//  Copyright © 2016年 dcpSsss. All rights reserved.
//

#import "HsWave.h"

@interface HsWave (){
    CGFloat _width;
    CGFloat _height;
}

@property(nonatomic,strong) CADisplayLink   *timer;

@property(nonatomic,strong) CAShapeLayer    *waveLayer;

@property(nonatomic,strong) CAShapeLayer    *maskLayer;

@property(nonatomic,assign)CGFloat          offset;

@end

@implementation HsWave

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _width          = frame.size.width;
        _height         = frame.size.height;
        
        self.waveSpeed = 0.7;
        self.waveCurvature = 2.0;
        self.waveHeight = 5;
        self.waveColor = [UIColor whiteColor];
        self.maskWaveColor = [[UIColor whiteColor] colorWithAlphaComponent:0.4];
        
        [self.layer addSublayer:self.waveLayer];
        [self.layer addSublayer:self.maskLayer];
        
        [self setTimer];
    }
    return self;
}

- (void)setTimer{
    self.timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(wave)];
    [self.timer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)wave{
    _offset += _waveSpeed;
    CGMutablePathRef wavePath = CGPathCreateMutable();
    CGPathMoveToPoint(wavePath, NULL, 0, _waveHeight+1);
    CGFloat y = 0.f;
    for (CGFloat x = 0.f; x <= _width ; x++) {
        y = _waveHeight * sinf(0.01 * self.waveCurvature * x + self.offset * 0.045);
        CGPathAddLineToPoint(wavePath, NULL, x, y);
    }
    CGPathAddLineToPoint(wavePath, NULL, _width, _waveHeight+1);
//    CGPathAddLineToPoint(wavePath, NULL, 0, _waveHeight+1);
    CGPathCloseSubpath(wavePath);
    _waveLayer.path = wavePath;
    CGPathRelease(wavePath);
    
    CGMutablePathRef maskPath = CGPathCreateMutable();
    CGPathMoveToPoint(maskPath, NULL, 0, _waveHeight+1);
    CGFloat maskY = 0.f;
    for (CGFloat x = 0.f; x <= _width ; x++) {
        maskY = _waveHeight * cosf(0.01 * self.waveCurvature * x + self.offset * 0.045);
        CGPathAddLineToPoint(maskPath, NULL, x, maskY);
    }
    CGPathAddLineToPoint(maskPath, NULL, _width, _waveHeight+1);
//    CGPathAddLineToPoint(maskPath, NULL, 0, _waveHeight+1);
    CGPathCloseSubpath(maskPath);
    _maskLayer.path = maskPath;
    CGPathRelease(maskPath);
    
    
}

-(CAShapeLayer *)waveLayer{
    if (_waveLayer == nil) {
        _waveLayer              = [CAShapeLayer layer];
        _waveLayer.frame        = CGRectMake(0, _height - _waveHeight, _width, _waveHeight);
        _waveLayer.fillColor    = _waveColor.CGColor;
    }
    return _waveLayer;
}

-(CAShapeLayer *)maskLayer{
    if (_maskLayer == nil) {
        _maskLayer              = [CAShapeLayer layer];
        _maskLayer.frame        = CGRectMake(0, _height - _waveHeight, _width, _waveHeight);
        _maskLayer.fillColor    = _maskWaveColor.CGColor;
    }
    return _maskLayer;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
