//
//  CMSpringyRopeView.m
//  DynamicXrayCatalog
//
//  Created by Chris Miles on 30/09/13.
//  Copyright (c) 2013-2014 Chris Miles. All rights reserved.
//
//  Based on CMTraerPhysics demo by Chris Miles, https://github.com/chrismiles/CMTraerPhysics
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "CMSpringyRopeView.h"
#import "CMSpringyRopeLayer.h"


@implementation CMSpringyRopeView

+ (Class)layerClass
{
    return [CMSpringyRopeLayer class];
}



- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
    
	[self.layer setContentsScale:[UIScreen mainScreen].scale];

        
        UIImage * backImage=[UIImage imageNamed:@"background.png"];
//        [backImage resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5) resizingMode:UIImageResizingModeStretch];
       backImage=[self OriginImage:backImage scaleToSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        UIColor *bgcolour=[UIColor colorWithPatternImage:backImage];
        self.backgroundColor=bgcolour;
//        UIImage *viewImage=[UIImage imageNamed:@"background.png"];
//        self.layer.contents=(id)viewImage.CGImage;
        

        


    }
    return self;
    
}


-(UIImage*) OriginImage:(UIImage *)image scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
    
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;   //返回的就是已经改变的图片
}

- (CMSpringyRopeLayer *)springyRopeLayer
{
    return (CMSpringyRopeLayer *)self.layer;
}


#pragma mark - FPS Label
-(void)setScoreLabel:(UILabel*)scoreLabel{
    [self.springyRopeLayer setScoreLabel:scoreLabel];
}

-(UILabel*)scorelabel{
    return [self.springyRopeLayer scoreLabel];
}


-(void)setRankLabel:(UILabel*)rankLabel{
    [self.springyRopeLayer setRankLabel:rankLabel];
}

-(UILabel*)Ranklabel{
    return [self.springyRopeLayer rankLabel];
}
//
//- (void)setFpsLabel:(UILabel *)fpsLabel
//{
//    [self.springyRopeLayer setFpsLabel:fpsLabel];
//}
//
//- (UILabel *)fpsLabel
//{
//    return [self.springyRopeLayer fpsLabel];
//}
//
//
//#pragma mark - Custom property accessors
//
//- (BOOL)smoothed
//{
//    return [self.springyRopeLayer smoothed];
//}
//
//- (void)setSmoothed:(BOOL)smoothed
//{
//    [self.springyRopeLayer setSmoothed:smoothed];
//}

- (BOOL)isDeviceMotionAvailable
{
    return [self.springyRopeLayer isDeviceMotionAvailable];
}

- (void)setGravityByDeviceMotionEnabled:(BOOL)gravityByDeviceMotionEnabled
{
    [self.springyRopeLayer setGravityByDeviceMotionEnabled:gravityByDeviceMotionEnabled];
}

- (BOOL)isGravityByDeviceMotionEnabled
{
    return [self.springyRopeLayer isGravityByDeviceMotionEnabled];
}

- (BOOL)isDynamicXrayEnabled
{
    return [self.springyRopeLayer isDynamicXrayEnabled];
}

- (void)setDynamicXrayEnabled:(BOOL)dynamicXrayEnabled
{
    [self.springyRopeLayer setDynamicXrayEnabled:dynamicXrayEnabled];
}

- (void)presentDynamicXrayConfigViewController
{
    [self.springyRopeLayer presentDynamicXrayConfigViewController];
}


#pragma mark - Handle touches

- (void)touchesBegan:(NSSet *)touches withEvent:(__unused UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint position = [touch locationInView:self];
    [self.springyRopeLayer touchBeganAtLocation:position];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(__unused UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint position = [touch locationInView:self];
    [self.springyRopeLayer touchMovedAtLocation:position];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(__unused UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint position = [touch locationInView:self];
    [self.springyRopeLayer touchEndedAtLocation:position];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(__unused UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint position = [touch locationInView:self];
    [self.springyRopeLayer touchCancelledAtLocation:position];
}

@end
