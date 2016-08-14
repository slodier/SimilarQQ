//
//  CollectionViewCell.m
//  娶老婆
//
//  Created by 736376103@qq.com on 16/4/7.
//  Copyright © 2016年 736376103@qq.com. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *array = [[NSBundle mainBundle]loadNibNamed:@"CollectionViewCell" owner:self options:nil];
        if (array.count<1) {
            return nil;
        }
        if (![[array objectAtIndex:0]isKindOfClass:[UICollectionViewCell class]]) {
            return nil;
        }
        self = [array objectAtIndex:0];

    }
    return self;
}

@end
