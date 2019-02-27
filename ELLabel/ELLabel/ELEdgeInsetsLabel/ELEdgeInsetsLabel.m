//
//  ELEdgeInsetsLabel.m
//  ELLabel
//
//  Created by Elvist on 2018/2/27.
//  Copyright © 2018 elvist. All rights reserved.
//

#import "ELEdgeInsetsLabel.h"

@implementation ELEdgeInsetsLabel

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    if (UIEdgeInsetsEqualToEdgeInsets(self.edgeInsets, UIEdgeInsetsZero)) {
        
        return [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    }
    // 注意：下面传入的bounds是真正的绘图区域
    CGRect rect = [super textRectForBounds:UIEdgeInsetsInsetRect(bounds, self.edgeInsets) limitedToNumberOfLines:numberOfLines];
    rect.origin.x -= self.edgeInsets.left;
    rect.origin.y -= self.edgeInsets.top;
    rect.size.width += self.edgeInsets.left + self.edgeInsets.right;
    rect.size.height += self.edgeInsets.top + self.edgeInsets.bottom;
    return rect;
}

- (void)drawTextInRect:(CGRect)rect
{
    if (UIEdgeInsetsEqualToEdgeInsets(self.edgeInsets, UIEdgeInsetsZero)) {
        
        return [super drawTextInRect:rect];
    }
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.edgeInsets)];
}

@end
