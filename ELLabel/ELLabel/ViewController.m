//
//  ViewController.m
//  ELLabel
//
//  Created by Elvist on 2019/2/27.
//  Copyright © 2019 elvist. All rights reserved.
//

#import "ViewController.h"

#import "ELEdgeInsetsLabel.h"

#define kScreenWidth    [UIScreen mainScreen].bounds.size.width
#define kScreenHeight   [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property (nonatomic, strong) ELEdgeInsetsLabel *edgeInsetsLabel;   ///< 有内边距的label

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupEdgeInsetsLabel];
    
    
}

- (void)setupEdgeInsetsLabel
{
    // init
    _edgeInsetsLabel = [ELEdgeInsetsLabel new];
    _edgeInsetsLabel.edgeInsets = UIEdgeInsetsMake(20, 15, 20, 15);
    _edgeInsetsLabel.backgroundColor = [UIColor orangeColor];
    _edgeInsetsLabel.numberOfLines = 0;
    [self.view addSubview:_edgeInsetsLabel];
    
    // 赋值
//    _edgeInsetsLabel.text = @"内边距label：text赋值\n测试1测试2测试3测试4测试5测试6测试7测试8测试9测试10测试11"
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 5; // 行间距
    paragraphStyle.alignment = NSTextAlignmentJustified;
    NSDictionary *attributes = @{NSParagraphStyleAttributeName : paragraphStyle
                                 };
    NSMutableAttributedString *attText = [[NSMutableAttributedString alloc] initWithString:@"内边距label：attributedText赋值\n测试1测试2测试3测试4测试5测试6测试7测试8测试9测试10测试11" attributes:attributes];
    _edgeInsetsLabel.attributedText = attText;
    
    // layout
    _edgeInsetsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [_edgeInsetsLabel addConstraint:[NSLayoutConstraint constraintWithItem:_edgeInsetsLabel
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                multiplier:0.0
                                                                  constant:1]];
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:_edgeInsetsLabel
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeTop
                                                            multiplier:1.0
                                                              constant:100],
                                [NSLayoutConstraint constraintWithItem:_edgeInsetsLabel
                                                             attribute:NSLayoutAttributeCenterX
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeCenterX
                                                            multiplier:1.0
                                                              constant:0],
                                [NSLayoutConstraint constraintWithItem:_edgeInsetsLabel
                                                             attribute:NSLayoutAttributeWidth
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeWidth
                                                            multiplier:1.0
                                                              constant:-100],
                                ]];
}

@end
