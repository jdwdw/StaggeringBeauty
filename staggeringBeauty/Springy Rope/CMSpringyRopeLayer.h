//
//  CMSpringyRopeLayer.h
//  DynamicXrayCatalog
//
//  Created by Chris Miles on 30/09/13.
//  Copyright (c) 2013-2014 Chris Miles. All rights reserved.
//
//  Based on CMTraerPhysics demo by Chris Miles, https://github.com/chrismiles/CMTraerPhysics
//  Based on traerAS3 example by Arnaud Icard, https://github.com/sqrtof5/traerAS3
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
#import <UIKit/UIKit.h>

@import QuartzCore;

@interface CMSpringyRopeLayer : CALayer

//@property (nonatomic, retain) UILabel *fpsLabel;
@property (nonatomic, assign, getter = isGravityByDeviceMotionEnabled) BOOL gravityByDeviceMotionEnabled;
@property (nonatomic, assign, readonly) BOOL isDeviceMotionAvailable;
//@property (nonatomic, assign) BOOL smoothed;
@property (nonatomic, assign, getter = isDynamicXrayEnabled) BOOL dynamicXrayEnabled;


@property(strong,nonatomic)UILabel *scoreLabel;
@property(strong,nonatomic)UILabel *rankLabel;


- (void)touchBeganAtLocation:(CGPoint)location;
- (void)touchMovedAtLocation:(CGPoint)location;
- (void)touchEndedAtLocation:(CGPoint)location;
- (void)touchCancelledAtLocation:(CGPoint)location;

- (void)presentDynamicXrayConfigViewController;

@end
